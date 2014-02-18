//
//  ModalViewController.h
//  DelegatePattern01
//
//  Created by Satoshi Nakagawa on 2013/12/20.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DismissDelegate <NSObject>
@required

- (void)dismissAction;

@end

@interface ModalViewController : UIViewController

@property (unsafe_unretained) id <DismissDelegate> delegate;

@end
