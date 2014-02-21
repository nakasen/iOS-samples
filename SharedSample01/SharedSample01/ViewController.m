//
//  ViewController.m
//  SharedSample01
//
//  Created by Satoshi Nakagawa on 2014/02/20.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"


@interface ViewController () <textFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (strong, nonatomic) SecondViewController *secondVC;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // _myTextField.delegate = self;
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate]; // シングルトンオブジェクト
    //_firstLabel.text = appDelegate.sharedString;
}

- (void)viewWillAppear:(BOOL)animated
{
    //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate]; // シングルトンオブジェクト
    //_firstLabel.text = appDelegate.sharedString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_myTextField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mySegue"]) {
        _secondVC = segue.destinationViewController;
        _secondVC.delegate = self;
        _secondVC.myString = _myTextField.text;
    }
}

- (void)firstTextFieldSend:(NSString *)argString
{
    _firstLabel.text = argString;
    NSLog(@"_firstLabel.text = %@", _firstLabel.text);
}

@end
