//
//  MySegue.m
//  CustomSegueSample1
//
//  Created by 中川 聡 on 12/03/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MySegue.h"

@implementation MySegue

- (void)perform {
    UIView *view = [self.destinationViewController view];
    [[self.sourceViewController view] addSubview:view];
    
    CGRect frame = view.frame;
    frame.origin = CGPointMake(frame.size.width, 0);
    view.frame = frame;
    
    [UIView animateWithDuration:0.2
                     animations:^{
                         CGRect frame = view.frame;
                         frame.origin.x = -frame.size.width / 2.0;
                         view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             [UIView animateWithDuration:0.3
                                              animations:^{
                                                  CGRect frame = view.frame;
                                                  frame.origin.x = frame.size.width / 3.0;
                                                  view.frame = frame;
                                              } completion:^(BOOL finished) {
                                                  if (finished) {
                                                      [UIView animateWithDuration:0.25
                                                                       animations:^{
                                                                           CGRect frame = view.frame;
                                                                           frame.origin.x = 0;
                                                                           view.frame = frame;
                                                                       } completion:^(BOOL finished) {
                                                                           [self.sourceViewController                             presentModalViewController:self.destinationViewController animated:NO];
                                                                       }];
                                                  }
                                              }];
                         }
                     }];
}

@end
