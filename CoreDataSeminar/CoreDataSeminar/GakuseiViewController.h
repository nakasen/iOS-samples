//
//  GakuseiViewController.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDDataManager.h"
#import "Gakusei.h"
#import "GakuseiCell.h"
#import "ShikakuViewController.h"


@interface GakuseiViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSPredicate *namePredicateTemplate;

@end
