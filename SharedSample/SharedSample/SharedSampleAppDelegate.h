//
//  SharedSampleAppDelegate.h
//  SharedSample
//
//  Created by 中川 聡 on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyClass.h"


@interface SharedSampleAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    SharedSampleViewController *viewController;
    MyClass *myClass;

}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) SharedSampleViewController *viewController;
@property (nonatomic, retain) MyClass *myClass;

@end
