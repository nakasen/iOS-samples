//
//  ASyncURLConnection.m
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ASyncURLConnection.h"

@implementation ASyncURLConnection

+ (id)request:(NSMutableURLRequest *)request completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    return [[self alloc] initWithRequest:request completeBlock:completeBlock errorBlock:errorBlock];
}

- (id)initWithRequest:(NSMutableURLRequest *)request completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    [request setTimeoutInterval:5.0];
    if ((self = [super initWithRequest:request delegate:self startImmediately:NO])) {
        data_ = [[NSMutableData alloc] init];
    }
    
    completeBlock_ = [completeBlock copy];
    errorBlock_ = [errorBlock copy];
    
    [self start];
    
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
    if (statusCode < 200 || statusCode >= 300) {
        NSLog(@"[ERROR] Server responded: status code %ld %@", statusCode,
              [NSHTTPURLResponse localizedStringForStatusCode:statusCode]);
        NSError *statusError = [NSError errorWithDomain:@"DBAccessError" code:statusCode userInfo:nil];
        // もう少しエラーの様式を整えるべき（課題）
        [self connection:connection didFailWithError:statusError];
    } else {
        [data_ setLength:0];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [data_ appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    completeBlock_(data_);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    errorBlock_(error);
}

@end
