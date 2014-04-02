//
//  MyCustomSegue.m
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/16.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import "MyCustomSegue.h"

@implementation MyCustomSegue

-(void)perform
{
    // 移動後のビューコントローラのビューを取得する
    UIView *view = [self.destinationViewController view];
    
    [[self.sourceViewController view] addSubview:view];
    
    // 初期位置の設定
    CGRect frame = view.frame;
    frame.origin = CGPointMake(frame.size.width, 0);
    frame.size = [[self.sourceViewController view] frame].size;
    view.frame = frame;
    
    // ビューが移動するアニメーション
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = view.frame;
        frame.origin.x = -frame.size.width / 2.0;
        view.frame = frame;
    }
                     completion:^(BOOL finished) {
                         if (finished)
                         {
                             [UIView animateWithDuration:0.3 animations:^{
                                 CGRect frame = view.frame;
                                 frame.origin.x = frame.size.width / 3.0;
                                 view.frame = frame;
                             }
                                              completion:^(BOOL finished) {
                                                  if (finished)
                                                  {
                                                      [UIView animateWithDuration:0.25 animations:^{
                                                          CGRect frame = view.frame;
                                                          frame.origin.x = 0;
                                                          view.frame = frame;
                                                      } completion:^(BOOL finished) {
                                                          // ビューをプッシュ表示する
                                                          [[self.sourceViewController navigationController]
                                                           pushViewController:self.destinationViewController animated:NO];
                                                      }];                      
                                                  }
                                              }];
                         }
                     }];     
}

@end
