//
//  DetailViewController.h
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/05/07.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *nameView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *idStr;

- (IBAction)retweetAction:(id)sender;

@end
