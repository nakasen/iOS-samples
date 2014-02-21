//
//  SecondViewController.m
//  SharedSample01
//
//  Created by Satoshi Nakagawa on 2014/02/20.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;

@end

@implementation SecondViewController

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
    NSLog(@"myString = %@", _myString);
    _myLabel.text = _myString;
    _secondTextField.delegate = self;
}

- (IBAction)buttonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(firstTextFieldSend:)])     {
        [self.delegate firstTextFieldSend:_secondTextField.text];
    } else {
        NSLog(@"プロトコルメソッド実装エラー");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_secondTextField resignFirstResponder];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.sharedString = _secondTextField.text;
    return YES;
}

@end
