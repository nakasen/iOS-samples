//
//  SecondViewController.h
//  SharedSample01
//
//  Created by Satoshi Nakagawa on 2014/02/20.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol textFieldDelegate <NSObject>

- (void)firstTextFieldSend:(NSString *)argString;

@end

@interface SecondViewController : UIViewController <textFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (strong, nonatomic) NSString *myString;

@property (unsafe_unretained) id <textFieldDelegate> delegate;

@end
