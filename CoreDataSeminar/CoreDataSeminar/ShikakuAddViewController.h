//
//  ShikakuAddViewController.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDDataManager.h"
#import "Gakusei.h"
#import "Shikaku.h"


@protocol ShikakuAddDelegate <NSObject>

- (void)shikakuAdd;

@end


@interface ShikakuAddViewController : UIViewController

@property (unsafe_unretained) id <ShikakuAddDelegate> delegate;
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UITextField *seqNoField;
@property (strong, nonatomic) IBOutlet UITextField *titleField;

- (IBAction)shikakuAddAction:(id)sender;

@end
