//
//  ShikakuViewController.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ShikakuViewController.h"


@interface ShikakuViewController ()

- (void)configureView;

@end


@implementation ShikakuViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize fetchExpression = _fetchExpression;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    /*
    if (self.detailItem) {
    
    }
    */
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // iOS6以降のセル再利用のパターン
    [self.tableView registerClass:[ShikakuCell class] forCellReuseIdentifier:@"ShikakuCell"];
    
    [self countDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView  titleForHeaderInSection:(NSInteger)section {
    return [[[self.fetchedResultsController sections] objectAtIndex:section] name];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // iOS6以降のセル再利用のパターン
    ShikakuCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"ShikakuCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

// ****************************************************************
// 　以下の４つのメソッドは UIViewController + UITableView の場合に必要
// 　　（UITableViewControllerでは自動に行われる）
// ****************************************************************

// ================================================================
// setEditing:animated:
// ================================================================

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
	[super setEditing:editing animated:animated];
	[self.tableView setEditing:editing animated:animated];
}

// ================================================================
// viewWillAppear:
// ================================================================

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
	// Unselect the selected row if any
	NSIndexPath *selection = [self.tableView indexPathForSelectedRow];
	if (selection){
		[self.tableView deselectRowAtIndexPath:selection animated:YES];
    }
}

// ================================================================
// viewDidAppear:
// ================================================================

- (void)viewDidAppear:(BOOL)animated
{
	//	The scrollbars won't flash unless the tableview is long enough.
	[self.tableView flashScrollIndicators];
}

// ================================================================
// didRotateFromInterfaceOrientation: (not called - iOS6)
// ================================================================

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[self.tableView flashScrollIndicators];
}

#pragma mark - Table view delegate

/*
// 以下のメソッドはUITableViewCellをカスタマイズした場合は必須（セルからのSegue設定が不可能なため）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}
*/

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *managedObjectContext = [CDDataManager sharedManager].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shikaku"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"seqNo" ascending:YES];
    //NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"gakusekiNo" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor1];
    [fetchRequest setSortDescriptors:sortDescriptors];
    // NSString *sectionKey = @"seqNo"; // このインスタンス名をinitWithFetchRequestメソッドの
    // sectionNameKeyPathパラメータとしてセットするとテーブルセクションのヘッダ名になる
    // 二重ソートなら通常第一キーを指定する
    
    
    // 取得条件の設定
    [NSFetchedResultsController deleteCacheWithName:@"Shikaku"]; // 取得条件を変更したらキャッシュの削除が必要
    //（またはcacheNameをnilにする）
    
    // 取得条件の設定（１）predicateWithFormatを使った場合（predicate文字列のパースにやや時間がかかる）
    // NSPredicate *titlePredicate = [NSPredicate predicateWithFormat:@"%K = %@",@"title", @"基本情報"];
    // [fetchRequest setPredicate:namePredicate];
    
    // 取得条件の設定（２）テンプレートを使った場合（（１）に比べてパフォーマンス改善効果がある）
    Gakusei *gakusei;
    NSString *gakusekiNo;
    
    gakusei = (Gakusei *)self.detailItem;
    gakusekiNo = gakusei.gakusekiNo;
    
    NSDictionary *variables;
    variables = [NSDictionary dictionaryWithObject:gakusekiNo forKey:@"gakusekiNo"];
    
    NSPredicate *gakusekiNoPredicate;
    gakusekiNoPredicate = [[self gakusekiNoPredicateTemplateSetting] predicateWithSubstitutionVariables:variables];
    
    [fetchRequest setPredicate:gakusekiNoPredicate];
    
    // 取得条件の設定（３）モデルエティタのfetchedPropertyを使った場合（もっと良い方法があるはず）
    // NSDictionary *entityProperties = [entity propertiesByName];
    // fetchedPropertyはNSFetchedPropertyDescription型オブジェクト
    // NSPredicate *namePredicate = [[[entityProperties objectForKey:@"fetchedProperty"] fetchRequest] predicate];
    // [fetchRequest setPredicate:namePredicate];
    // NSArray *gakusekiNoFetch = [NSArray arrayWithObject:[entityProperties objectForKey:@"fetchedProperty"]];
    // [fetchRequest setPropertiesToFetch:gakusekiNoFetch];
    
    // 取得条件の設定（４）モデルエディタのFETCH REQUESTS取得の試み（不明）
    
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                    managedObjectContext:managedObjectContext
                                                                      sectionNameKeyPath:nil
                                 // このパラメータを設定するとその指定フィールドの値がヘッダ名になる。
                                                                               cacheName:@"Shikaku"];
    _fetchedResultsController.delegate = self;
    
	NSError *error = nil;
	if (![_fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}

// テンプレートを使ったpredicate生成の際に必要なメソッド
- (NSPredicate *)gakusekiNoPredicateTemplateSetting {
    if (_gakusekiNoPredicateTemplate == nil) {
        _gakusekiNoPredicateTemplate = [NSPredicate predicateWithFormat:@"gakusei.gakusekiNo LIKE $gakusekiNo"];
    }
    return _gakusekiNoPredicateTemplate;
}

- (NSArray *)fetchExpression {
    
    // Entityの集計関数をNSExpressionDescriptionで求める（今回はgakuseiのshikaku件数）
    // 集計関数の結果はfetchResultsControllerでは使えないので個別にfetchRequestを作成
    // 　（setResultTypeでNSDictionaryResultTypeを指定した場合はfetchResultsControllerで使えない
    // 　　それ以外のTypeを指定した場合は未検証）
    // 今回の場合は件数なのでNSFetchedResultsSectionInfoの情報を使っても同じ結果が得られる
    // 　（そちらの方が簡単）
    
    Gakusei *gakusei = self.detailItem;
    NSString *gakusekiNo = gakusei.gakusekiNo;
    
    NSManagedObjectContext *managedObjectContext = [CDDataManager sharedManager].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Shikaku"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setResultType:NSDictionaryResultType];
    NSExpression *keyPathExpression = [NSExpression expressionForKeyPath:@"seqNo"];
    NSExpression *countExpression = [NSExpression expressionForFunction:@"count:" arguments:@[keyPathExpression]];
    NSExpressionDescription *expressionDescription = [[NSExpressionDescription alloc] init];
    [expressionDescription setName:@"shikakuCount"];
    [expressionDescription setExpression:countExpression];
    [expressionDescription setExpressionResultType:NSInteger16AttributeType];
    [fetchRequest setPropertiesToFetch:@[expressionDescription]];
    
    NSDictionary *variables = [NSDictionary dictionaryWithObject:gakusekiNo forKey:@"gakusekiNo"];
    
    NSPredicate *gakusekiNoPredicate =
    [[self gakusekiNoPredicateTemplateSetting] predicateWithSubstitutionVariables:variables];
    
    [fetchRequest setPredicate:gakusekiNoPredicate];
    
    NSError *error = nil;
    if (!(_fetchExpression = [managedObjectContext executeFetchRequest:fetchRequest error:&error])) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchExpression;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:(ShikakuCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
    
    [[CDDataManager sharedManager] save];
    [self countDisplay];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
 // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
*/

- (void)configureCell:(ShikakuCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Shikaku *shikaku = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.seqNoLabel.text = [NSString stringWithFormat:@"%@", shikaku.seqNo];
    cell.titleLabel.text = shikaku.title;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"shikakuAddSegue"]) {
        Gakusei *gakusei = (Gakusei *)self.detailItem;
        [[segue destinationViewController] setDetailItem:gakusei];
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)countDisplay
{
    Gakusei *gakusei = (Gakusei *)self.detailItem;    
    NSUInteger shikakuCount = [[[self.fetchExpression objectAtIndex:0] valueForKey:@"shikakuCount"] intValue];    
    NSString *titleString = [NSString stringWithFormat:@"%@  %d件", gakusei.name, shikakuCount];
    self.navigationItem.title = titleString;
}

// デリゲートメソッド（モーダルビューを呼び出す側でdismiss処理を実行する）
- (void)shikakuAdd
{
    [self countDisplay];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
