//
//  ListTableViewController.m
//  UITableViewControllerSample01
//
//  Created by nakagawa on 2013/12/09.
//  Copyright (c) 2013年 13cm. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

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
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *dataArray = [userDefaults stringArrayForKey:@"GakuseiData"];
    self.gakuseiArray = [NSMutableArray arrayWithArray:dataArray];

}

- (void)viewWillDisappear:(BOOL)animated
{
    NSUserDefaults *userDefautls = [NSUserDefaults standardUserDefaults];
    [userDefautls setObject:(NSArray *)self.gakuseiArray forKey:@"GakuseiData"];
     // テーブルビューが消える時にすべてのセルをユーザデフォルトに書き込む
    [userDefautls synchronize];
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
    return 1; // セクション数は1
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.gakuseiArray count]; // セクション中の行数はgakuseiArrayの要素数
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.gakuseiArray objectAtIndex:indexPath.row];
    // セルのn行目にgakuseiArray要素のn番目の内容を表示
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES; // YESで編集可能
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) { // 削除の時
        // Delete the row from the data source
        [self.gakuseiArray removeObjectAtIndex:indexPath.row]; // 配列から１行削除
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; // 画面から１行削除
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    if (editing) { // 編集モード
        UIBarButtonItem *addButton =
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                      target:self
                                                      action:@selector(addRow:)];
        [self.navigationItem setLeftBarButtonItem:addButton animated:YES]; // 追加ボタンを表示
    } else { // 通常モード
        [self.navigationItem setLeftBarButtonItem:nil animated:YES]; // 追加ボタンを非表示
    }
}

- (void)addRow:(id)sender {
    /*
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.gakuseiArray.count inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObjects:indexPath, nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.tailNumber = [userDefaults integerForKey:@"TailNumber"];
    // ユーザデフォルトから最後の番号を読み込み
    [self.gakuseiArray addObject:[NSString stringWithFormat:@"13CM01%02d", self.tailNumber + 1]]; // 配列に１行追加
    [userDefaults setInteger:self.tailNumber + 1 forKey:@"TailNumber"];
    // ユーザデフォルトに最後の番号を保存
    [userDefaults synchronize]; // 値を即座に反映
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationTop]; // 画面に１行追加
     */
    [self performSegueWithIdentifier:@"addSegue" sender:self];
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    if(fromIndexPath.section == toIndexPath.section) { // 移動元と移動先は同じセクション
        if(self.gakuseiArray && toIndexPath.row < [self.gakuseiArray count]) {
            id item = [self.gakuseiArray objectAtIndex:fromIndexPath.row]; // 移動対象を保持
            [self.gakuseiArray removeObject:item]; // 配列から一度削除
            [self.gakuseiArray insertObject:item atIndex:toIndexPath.row]; // 保持しておいた対象を挿入
        }
    }
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES; // YESで移動可能
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailViewController.gakusekiNo = [NSString stringWithFormat:@"%@", [self.gakuseiArray objectAtIndex:indexPath.row]];
    } else if ([segue.identifier isEqualToString:@"addSegue"]) {
        AddViewController *addViewController = [segue destinationViewController];
        addViewController = [segue destinationViewController];
        addViewController.delegate = self;
        addViewController.gakuseiArray = self.gakuseiArray;
    }
}

- (void)dismissViewController
{    
    [self.tableView reloadData]; // テーブルビューの再描画
    [self dismissViewControllerAnimated:YES completion:NULL]; // デリゲートメソッド
}













@end
