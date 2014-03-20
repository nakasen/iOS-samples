//
//  UpdateViewController.h
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/17.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASyncURLConnection.h"
#import "DBURLString.h"

@interface UpdateViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *gnoLabel;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *errorMessageLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *accessIndicator;
@property (nonatomic, copy) NSString *gnoText;
@property (nonatomic, copy) NSString *nameText;
@property (nonatomic) BOOL errorStatus;

- (IBAction)cancelAction:(id)sender;
- (IBAction)updateAction:(id)sender;
- (IBAction)deleteAction:(id)sender;

@end
