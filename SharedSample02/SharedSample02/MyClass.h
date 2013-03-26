//
//  MyClass.h
//  SharedSample02
//
//  Created by 中川 聡 on 11/11/23.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ViewController.h"

@interface MyClass : NSObject {
    AppDelegate *appDelegate;
}

- (id)init;

- (void)valueSet;


@end
