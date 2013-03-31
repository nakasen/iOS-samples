//
//  GakuseiAddViewController.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDDataManager.h"
#import "Gakusei.h"


@interface GakuseiAddViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *gakusekiNoField;
@property (strong, nonatomic) IBOutlet UITextField *nameField;

- (IBAction)gakuseiAddAction:(id)sender;

@end
