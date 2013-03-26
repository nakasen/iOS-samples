//
//  MyClass.m
//  SharedSample02
//
//  Created by 中川 聡 on 11/11/23.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass 

- (id)init {
    [super init];
    if (self != nil) {
        appDelegate = [[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)valueSet {
    appDelegate.viewController.myLabel.text = [NSString stringWithFormat:@"%d", 300];
}

@end
