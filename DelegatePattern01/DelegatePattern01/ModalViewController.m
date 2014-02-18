//
//  ModalViewController.m
//  DelegatePattern01
//
//  Created by Satoshi Nakagawa on 2013/12/20.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

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

- (IBAction)dismissAction:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:NULL]; // 自分でdismissするのはNG
    if ([self.delegate respondsToSelector:@selector(dismissAction)]) // modal表示させた側でdismissする
    {
        [self.delegate dismissAction];
    } else {
        NSLog(@"プロトコルメソッド実装エラー");
    }
}

@end
