//
//  ViewController.m
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/13.
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

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [self.conditionTextField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"listSegue"]) {
        ListViewController *listViewController = (ListViewController *)[segue destinationViewController];
        listViewController.conditionString = self.conditionTextField.text;
    }
}

@end
