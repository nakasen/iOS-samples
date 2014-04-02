//
//  ListTableViewController.h
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/09.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "AddViewController.h"

@interface ListTableViewController : UITableViewController <AddViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *gakuseiArray;
@property (nonatomic) int tailNumber;

@end
