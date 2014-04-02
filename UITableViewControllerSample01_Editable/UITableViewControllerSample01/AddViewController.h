//
//  AddViewController.h
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/18.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddViewControllerDelegate <NSObject>

- (void)dismissViewController;

@end


@interface AddViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *gakuseiArray;
@property (unsafe_unretained) id <AddViewControllerDelegate> delegate;

- (IBAction)addAction:(id)sender;

@end

