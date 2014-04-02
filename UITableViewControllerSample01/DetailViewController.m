//
//  DetailViewController.m
//  UITableViewControllerSample01
//
//  Created by Satoshi Nakagawa on 2014/04/02.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

// - (void)configureView;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailLabel.text = [self.detailItem description];
    }
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self configureView];
    
    _detailLabel.text = [NSString stringWithFormat:@"都道府県庁所在地は、%@です。", self.detailString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
