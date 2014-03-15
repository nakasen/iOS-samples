//
//  TimeLineTableViewController.h
//  TwitterClientSample02
//
//  Created by 中川 聡 on 2013/04/26.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "DetailViewController.h"
#import "TimeLineCell.h"

@interface TimeLineTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *timeLineData;
@property (nonatomic, copy) NSString *httpErrorMessage;
@property (nonatomic, copy) NSString *identifier;
@property dispatch_queue_t mainQueue;
@property dispatch_queue_t imageQueue;

@end
