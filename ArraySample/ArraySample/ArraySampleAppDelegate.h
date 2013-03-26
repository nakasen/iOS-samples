//
//  ArraySampleAppDelegate.h
//  ArraySample
//
//  Created by 中川 聡 on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArraySampleViewController;

@interface ArraySampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ArraySampleViewController *viewController;

@end
