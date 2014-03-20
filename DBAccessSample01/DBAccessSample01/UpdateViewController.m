//
//  UpdateViewController.m
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/17.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.gnoLabel.text = self.gnoText;
    self.nameTextField.text = self.nameText;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [self.nameTextField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)updateAction:(id)sender {
    self.errorStatus = NO;
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:self.gnoLabel.text, @"gno", self.nameTextField.text, @"name", nil];
    NSArray *jsonArray = [NSArray arrayWithObjects:jsonDict, nil];
    NSError *jsonError = nil;
    // 本来JSONシリアライズは重い処理なのでglobal queueに回すべきだが、今回は１件のみなのでメインスレッドで
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:jsonArray
                                                       options:kNilOptions
                                                         error:&jsonError];
    if (!jsonError) {
        DBURLString *dbURLString = [[DBURLString alloc] init];
        NSURL *url = [NSURL URLWithString:[dbURLString setURLString]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"PUT"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:bodyData];
        [self.accessIndicator startAnimating];
        [ASyncURLConnection request:request completeBlock:^(NSData *data) {
            [self.accessIndicator stopAnimating];
            if (!self.errorStatus) {
                // ひとつ前のTableViewを更新する処理
                [self popViewControllerAction];
            }
        } errorBlock:^(NSError *error) {
            NSLog(@"[ERROR] An error occurred during the server access: %@", [error localizedDescription]);
            self.errorStatus = YES;
            self.errorMessageLabel.text = @"エラー発生";
            [self.accessIndicator stopAnimating];
        }];
    } else {
        NSLog(@"[ERROR] JSON error: %@", [jsonError localizedDescription]);
        self.errorMessageLabel.text = @"エラー発生";
    }
}

- (IBAction)deleteAction:(id)sender {
    self.errorStatus = NO;
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:self.gnoLabel.text, @"gno", nil];
    NSArray *jsonArray = [NSArray arrayWithObjects:jsonDict, nil];
    NSError *jsonError = nil;
    // 本来JSONシリアライズは重い処理なのでglobal queueに回すべきだが、今回は１件のみなのでメインスレッドで
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:jsonArray
                                                       options:kNilOptions
                                                         error:&jsonError];
    if (!jsonError) {
        DBURLString *dbURLString = [[DBURLString alloc] init];
        NSURL *url = [NSURL URLWithString:[dbURLString setURLString]];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"DELETE"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:bodyData];
        [self.accessIndicator startAnimating];
        [ASyncURLConnection request:request completeBlock:^(NSData *data) {
            [self.accessIndicator stopAnimating];
            if (!self.errorStatus) {
                // ひとつ前のTableViewを更新する処理
                [self popViewControllerAction];
            }
        } errorBlock:^(NSError *error) {
            NSLog(@"[ERROR] An error occurred during the server access: %@", [error localizedDescription]);
            self.errorStatus = YES;
            self.errorMessageLabel.text = @"エラー発生";
            [self.accessIndicator stopAnimating];
        }];
    } else {
        NSLog(@"[ERROR] JSON error: %@", [jsonError localizedDescription]);
        self.errorMessageLabel.text = @"エラー発生";
    }
}

- (void)popViewControllerAction
{
    NSArray *viewControllersArray = [self.navigationController viewControllers];
    NSInteger currentIndex = [viewControllersArray count] - 1;
    UITableViewController *tableViewController = (UITableViewController *)[viewControllersArray objectAtIndex:currentIndex - 1];
    [tableViewController viewDidLoad];
    [tableViewController.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
