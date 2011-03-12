//
//  PropertySampleAppDelegate.h
//  PropertySample
//
//  Created by 中川 聡 on 11/02/27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class PropertySampleViewController;

@interface PropertySampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PropertySampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PropertySampleViewController *viewController;

@end

