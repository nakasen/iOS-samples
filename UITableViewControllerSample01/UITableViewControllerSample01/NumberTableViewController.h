//
//  NumberTableViewController.h
//  UITableViewControllerSample01
//
//  Created by Satoshi Nakagawa on 2014/03/28.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *detailArray;
@property (nonatomic, strong) NSArray *sectionHeaderArray;

@end
