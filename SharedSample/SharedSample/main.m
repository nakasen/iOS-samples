//
//  main.m
//  SharedSample
//
//  Created by 中川 聡 on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"SharedSampleAppDelegate");
    [pool release];
    return retVal;
}
