//
//  ListViewController.m
//  DBAccessSample01
//
//  Created by 中川 聡 on 2013/06/13.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

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
    
    [self getAction];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (!self.arrayFromJSON) {
        return 1;
    } else {
        return [self.arrayFromJSON count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (self.httpErrorMessage) {
        cell.textLabel.text = self.httpErrorMessage;
    } else if (!self.arrayFromJSON) {
        cell.textLabel.text = @"Loading...";
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@\t%@",
                               [[self.arrayFromJSON objectAtIndex:indexPath.row] objectForKey:@"gno"],
                               [[self.arrayFromJSON objectAtIndex:indexPath.row] objectForKey:@"name"]];
    }
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)getAction {
    DBURLString *dbURLString = [[DBURLString alloc] init];
    NSMutableString *urlString = [NSMutableString stringWithString:[dbURLString setURLString]];
    if ([self.conditionString length] != 0) {
        NSString *encodingCondition = [self.conditionString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [urlString appendFormat:@"?condition=%@", encodingCondition];
    }
    
    NSLog(@"urlString = %@", urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    [self.accessIndicator startAnimating];
    [ASyncURLConnection request:request completeBlock:^(NSData *data) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            NSError *jsonError = nil;
            self.arrayFromJSON = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&jsonError];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (self.arrayFromJSON) {
                    NSLog(@"JSON→NSArray：%@", self.arrayFromJSON);
                } else {
                    NSLog(@"[ERROR] JSON error: %@", [jsonError localizedDescription]);
                    self.httpErrorMessage = @"エラー発生";
                }
                [self.accessIndicator stopAnimating];
                [self.tableView reloadData];
            });
        });
    } errorBlock:^(NSError *error) {
        NSLog(@"[ERROR] An error occurred during the server access: %@", [error localizedDescription]);
        self.httpErrorMessage = @"エラー発生";
        [self.accessIndicator stopAnimating];
        [self.tableView reloadData];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"updateSegue"]) {
        UpdateViewController *updateViewController = (UpdateViewController *)[segue destinationViewController];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *cellDictionary = [self.arrayFromJSON objectAtIndex:indexPath.row];
        NSString *gno = [cellDictionary objectForKey:@"gno"];
        NSString *name = [cellDictionary objectForKey:@"name"];
        
        updateViewController.gnoText = gno;
        updateViewController.nameText = name;
    }
}

@end
