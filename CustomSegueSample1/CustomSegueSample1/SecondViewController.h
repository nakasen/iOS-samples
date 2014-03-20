//
//  SecondViewController.h
//  CustomSegueSample1
//
//  Created by 中川 聡 on 12/03/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController {
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *tempButton;
    UIView *view;
}

- (IBAction)back:(id)sender;

@end
