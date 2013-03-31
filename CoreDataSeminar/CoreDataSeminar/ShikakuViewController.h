//
//  ShikakuViewController.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDDataManager.h"
#import "Gakusei.h"
#import "Shikaku.h"
#import "ShikakuCell.h"
#import "ShikakuAddViewController.h"


@interface ShikakuViewController : UIViewController <NSFetchedResultsControllerDelegate, ShikakuAddDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, readonly) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, readonly) NSArray *fetchExpression;
@property (nonatomic, strong) NSPredicate *gakusekiNoPredicateTemplate;

@end
