//
//  ViewController.m
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/09.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *dataArray = [NSArray arrayWithObjects:
                          @"13CM0101",
                          @"13CM0102",
                          @"13CM0103",
                          @"13CM0104",
                          @"13CM0105", nil];
    [userDefaults registerDefaults:
        [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt:5], @"TailNumber",
        dataArray, @"GakuseiData",
        nil]]; // ユーザデフォルトの初期値を設定

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
