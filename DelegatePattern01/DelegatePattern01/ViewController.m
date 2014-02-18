//
//  ViewController.m
//  DelegatePattern01
//
//  Created by Satoshi Nakagawa on 2013/12/20.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissAction
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"modalSegue"]) {
        ModalViewController *modalVC = [segue destinationViewController];
        modalVC.delegate = self;
    }
}

@end
