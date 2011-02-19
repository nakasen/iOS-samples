//
//  Annotation_ArraySampleAppDelegate.h
//  Annotation_ArraySample
//
//  Created by 中川 聡 on 11/02/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class Annotation_ArraySampleViewController;

@interface Annotation_ArraySampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Annotation_ArraySampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Annotation_ArraySampleViewController *viewController;

@end

