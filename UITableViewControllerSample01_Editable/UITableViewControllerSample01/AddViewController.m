//
//  AddViewController.m
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/18.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addTextField;

@end

@implementation AddViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addAction:(id)sender {
    [self.gakuseiArray addObject:self.addTextField.text]; // 配列に１行追加
    NSLog(@"gakuseiArray = %@", self.gakuseiArray);
    
    if ([self.delegate respondsToSelector:@selector(dismissViewController)]) {
        // ListTableViewControllerのデリゲートメソッドを呼ぶ
        [self.delegate dismissViewController];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.addTextField resignFirstResponder]; // キーボードを引っ込める
    return YES;
}

@end
