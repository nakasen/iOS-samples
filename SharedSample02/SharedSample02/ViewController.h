//
//  ViewController.h
//  SharedSample02
//
//  Created by 中川 聡 on 11/11/23.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyClass.h"

@class MyClass;

@interface ViewController : UIViewController {
    
    MyClass *myClass;
    
    IBOutlet UILabel *myLabel;
    IBOutlet UIButton *myButton;
}

- (IBAction)buttonPush;

@property (strong, nonatomic) UILabel *myLabel;

@end
