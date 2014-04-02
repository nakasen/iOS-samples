//
//  NumberTableViewController.m
//  UITableViewControllerSample01
//
//  Created by Satoshi Nakagawa on 2014/03/28.
//  Copyright (c) 2014年 nakasen.com. All rights reserved.
//

#import "NumberTableViewController.h"

#import "DetailViewController.h"

@interface NumberTableViewController ()
{
    //NSArray *dataArray;
    //NSArray *sectionHeaderArray;
}

@end

@implementation NumberTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // dataArray = @[@"A", @"B", @"C"];
    // dataArray = [NSArray arrayWithObjects:@"A", @"B", @"C", nil]; // 旧来の書き方
    // 
    // dataArray = @[@1, @2, @3];
    // dataArray = [NSArray arrayWithObjects: // 旧来の書き方
    //              [NSNumber numberWithInt:1],
    //              [NSNumber numberWithInt:2],
    //              [NSNumber numberWithInt:3],
    //              nil];
    
    _dataArray = @[@[@"北海道"],
                   @[@"青森県", @"岩手県", @"秋田県", @"宮城県", @"山形県", @"福島県"],
                   @[@"茨城県", @"栃木県", @"群馬県", @"千葉県", @"埼玉県", @"東京都", @"神奈川県"]];
    
    _detailArray = @[@[@"札幌"],
                   @[@"青森", @"盛岡", @"秋田", @"仙台", @"山形", @"福島"],
                   @[@"水戸", @"宇都宮", @"前橋", @"千葉", @"さいたま", @"東京", @"横浜"]];
    
    _sectionHeaderArray = @[@"北海道地方", @"東北地方", @"関東地方"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [_dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    // return [[_dataArray objectAtIndex:section] count]; // 旧来の書き方
    return [_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"Cell"];
    
    // Configure the cell...
    // cell.textLabel.text = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]; // 旧来の書き方
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section // セクションのヘッダタイトル
{
    // return [_sectionArray objectAtIndex:section]; // 旧来の書き方
    return _sectionHeaderArray[section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.detailString = [[self.detailArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        DetailViewController *detailVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.detailString = _detailArray[indexPath.section][indexPath.row];
    }
}


@end
