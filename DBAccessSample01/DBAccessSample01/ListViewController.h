//
//  ListViewController.h
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/13.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateViewController.h"
#import "ASyncURLConnection.h"
#import "DBURLString.h"

@interface ListViewController : UITableViewController

@property (nonatomic, strong) NSArray *arrayFromJSON;
@property (nonatomic, copy) NSString *httpErrorMessage;
@property (nonatomic, copy) NSString *conditionString;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *accessIndicator;

@end
