//
//  ViewController.m
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/04/25.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.accountStore = [[ACAccountStore alloc] init];
    ACAccountType *twitterType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [self.accountStore requestAccessToAccountsWithType:twitterType
                                               options:NULL
                                            completion:^(BOOL granted, NSError *error) {
         if (granted) {
             self.twitterAccounts = [self.accountStore accountsWithAccountType:twitterType];
             if (self.twitterAccounts > 0) {
                 ACAccount *account = [self.twitterAccounts lastObject];
                 self.identifier = account.identifier;
                 dispatch_async(dispatch_get_main_queue(), ^{
                     self.accountDisplayLabel.text = account.username;
                 });
             }
             else {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     self.accountDisplayLabel.text = @"アカウントなし";
                 });
             }
         }
         else {
             NSLog(@"Account Error: %@", [error localizedDescription]);
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.accountDisplayLabel.text = @"アカウント認証エラー";
             });
         }
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setAccountAction:(id)sender {

    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    sheet.delegate = self;

    sheet.title = @"選択してください。";
    for (ACAccount *account in self.twitterAccounts) {
        [sheet addButtonWithTitle:account.username];
    }
    [sheet addButtonWithTitle:@"キャンセル"];
    sheet.cancelButtonIndex = self.twitterAccounts.count;
    sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.twitterAccounts.count > 0) {
        if (buttonIndex != self.twitterAccounts.count) {
            ACAccount *account = [self.twitterAccounts objectAtIndex:buttonIndex];
            self.identifier = account.identifier;
            NSLog(@"Account set! %@", account.username);
        }
        else {
            NSLog(@"cancel!");
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    TimeLineTableViewController *timeLineTableViewController = [segue destinationViewController];
    timeLineTableViewController.identifier = self.identifier;
}

@end
