//
//  AnnotationSampleAppDelegate.h
//  AnnotationSample
//
//  Created by 中川 聡 on 11/01/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@class AnnotationSampleViewController;

@interface AnnotationSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AnnotationSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AnnotationSampleViewController *viewController;

@end

