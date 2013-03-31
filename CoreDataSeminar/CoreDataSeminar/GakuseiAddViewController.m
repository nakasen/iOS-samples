//
//  GakuseiAddViewController.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "GakuseiAddViewController.h"


@interface GakuseiAddViewController ()

@end


@implementation GakuseiAddViewController

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)gakuseiAddAction:(id)sender {
    
    NSManagedObjectContext *managedObjectContext = [CDDataManager sharedManager].managedObjectContext;
    Gakusei *gakusei = [NSEntityDescription insertNewObjectForEntityForName:@"Gakusei"
                                                     inManagedObjectContext:managedObjectContext];
    
    gakusei.gakusekiNo = self.gakusekiNoField.text;
    gakusei.name = self.nameField.text;
    
    [[CDDataManager sharedManager] save];
    
    // 自分自身（モーダルビュー）をdimissする
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
