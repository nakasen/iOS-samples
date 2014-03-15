//
//  ViewController.h
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/04/25.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "TimeLineTableViewController.h"

@interface ViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UILabel *accountDisplayLabel;
@property (nonatomic, strong) ACAccountStore *accountStore;
@property (nonatomic, strong) NSArray *twitterAccounts;
@property (nonatomic, copy) NSString *identifier;

- (IBAction)setAccountAction:(id)sender;

@end
