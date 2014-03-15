//
//  TweetSheetViewController.h
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/04/25.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>


@interface TweetSheetViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *tweetTextView;
@property (nonatomic, strong) ACAccountStore *accountStore;

- (IBAction)editEndAction:(id)sender;
- (IBAction)tweetAction:(id)sender;

@end
