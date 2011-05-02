//
//  MyClass.m
//  SharedSample
//
//  Created by 中川 聡 on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyClass.h"


@implementation MyClass

@synthesize sharedVal;

- (MyClass *)init
{
    sharedVal = 100;
    return self;
}

@end
