//
//  MyUIApplication.m
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/05/20.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "MyUIApplication.h"

@implementation MyUIApplication

@synthesize myOpenURL;

- (BOOL)openURL:(NSURL *)url
{
    if (!url) {
        return NO;
    }
    
    self.myOpenURL = url;
    
    AppDelegate *appDelegate = (AppDelegate *)[self delegate];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                         bundle:[NSBundle mainBundle]];
    WebViewController *webViewController =
    [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    NSLog(@"webViewController = %@", webViewController);
    webViewController.openURL = myOpenURL;
    webViewController.title = @"Web View";
    
    // UINavigationController *navigationController = [[UINavigationController alloc] init];
    [appDelegate.navigationController pushViewController:webViewController animated:YES];
    //[navigationController pushViewController:webViewController animated:YES];
    
    self.myOpenURL = nil;
    
    return YES;
}

@end

