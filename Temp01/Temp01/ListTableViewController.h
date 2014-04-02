//
//  ListTableViewController.h
//  Temp01
//
//  Created by Satoshi Nakagawa on 2014/04/02.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"//>

@interface ListTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *sectionHeaderArray;
@property (nonatomic, strong) NSArray *detailArray;

@end
