//
//  AddViewController.h
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/14.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASyncURLConnection.h"
#import "DBURLString.h"

@interface AddViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *gnoTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *errorMessageLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *accessIndicator;
@property (nonatomic) BOOL errorStatus;

- (IBAction)cancelAction:(id)sender;
- (IBAction)addAction:(id)sender;

@end
