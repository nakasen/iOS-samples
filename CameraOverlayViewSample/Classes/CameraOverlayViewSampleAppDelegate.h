//
//  CameraOverlayViewSampleAppDelegate.h
//  CameraOverlayViewSample
//
//  Created by 中川 聡 on 11/02/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class CameraOverlayViewSampleViewController;

@interface CameraOverlayViewSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CameraOverlayViewSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CameraOverlayViewSampleViewController *viewController;

@end

