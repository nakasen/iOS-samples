//
//  DetailViewController.h
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/16.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (nonatomic, strong) NSString *gakusekiNo;

- (IBAction)back:(id)sender;

@end
