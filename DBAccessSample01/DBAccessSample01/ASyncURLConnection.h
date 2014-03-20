//
//  ASyncURLConnection.h
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^completeBlock_t)(NSData *data);
typedef void (^errorBlock_t)(NSError *error);

@interface ASyncURLConnection : NSURLConnection
{
    NSMutableData *data_;
    completeBlock_t completeBlock_;
    errorBlock_t errorBlock_;

}

+ (id)request:(NSMutableURLRequest *)request completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock;

- (id)initWithRequest:(NSMutableURLRequest *)request completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock;

@end
