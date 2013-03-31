//
//  GakuseiViewController.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "GakuseiViewController.h"


@interface GakuseiViewController ()

@end


@implementation GakuseiViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // iOS6以降のセル再利用のパターン
    [self.tableView registerClass:[GakuseiCell class] forCellReuseIdentifier:@"GakuseiCell"];
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
    GakuseiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GakuseiCell" forIndexPath:indexPath];
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

// 以下のメソッドはUITableViewCellをカスタマイズした場合は必須（セルからのSegue設定が不可能なため）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [self performSegueWithIdentifier:@"shikakuSegue" sender:self];
}

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *managedObjectContext = [CDDataManager sharedManager].managedObjectContext;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Gakusei"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"gakusekiNo" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor1, sortDescriptor2];
    [fetchRequest setSortDescriptors:sortDescriptors];
    NSString *sectionKey = @"name"; // このインスタンス名をinitWithFetchRequestメソッドの
    // sectionNameKeyPathパラメータとしてセットするとテーブルセクションのヘッダ名になる
    // 二重ソートなら通常第一キーを指定する
    
    
    // 取得条件の設定
    [NSFetchedResultsController deleteCacheWithName:@"Gakusei"]; // 取得条件を変更したらキャッシュの削除が必要
    //（またはcacheNameをnilにする）
    
    // 取得条件の設定（１）predicateWithFormatを使った場合（predicate文字列のパースにやや時間がかかる）
    // NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"%K = %@",@"gakusekiNo", @"11CM0102"];
    // [fetchRequest setPredicate:namePredicate];
    
    // 取得条件の設定（２）テンプレートを使った場合（（１）に比べてパフォーマンス改善効果がある）
    // NSString *name = @"11CM0102";
    // NSDictionary *variables = [NSDictionary dictionaryWithObject:name forKey:@"name"];
    // NSPredicate *namePredicate = [[self namePredicateTemplateSetting] predicateWithSubstitutionVariables:variables];
    // [fetchRequest setPredicate:namePredicate];
    
    // 取得条件の設定（３）モデルエティタのFetched Propertiesを使った場合（もっと良い方法があるはず）
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
                                                                      sectionNameKeyPath:sectionKey
                                 // このパラメータを設定するとその指定フィールドの値がヘッダ名になる。
                                                                               cacheName:@"Gakusei"];
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
- (NSPredicate *)namePredicateTemplateSetting {
    if (_namePredicateTemplate == nil) {
        _namePredicateTemplate = [NSPredicate predicateWithFormat:@"gakusekiNo like $name"];
    }
    return _namePredicateTemplate;
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
            [self configureCell:(GakuseiCell *)[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
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

- (void)configureCell:(GakuseiCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Gakusei *gakusei = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.gakusekiNoLabel.text = gakusei.gakusekiNo;
    cell.nameLabel.text = gakusei.name;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"shikakuSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Gakusei *gakusei = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:gakusei];
    }
}

@end
