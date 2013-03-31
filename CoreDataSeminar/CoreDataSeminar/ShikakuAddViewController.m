//
//  ShikakuAddViewController.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ShikakuAddViewController.h"


@interface ShikakuAddViewController ()

@end


@implementation ShikakuAddViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)shikakuAddAction:(id)sender {
    NSManagedObjectContext *managedObjectContext = [CDDataManager sharedManager].managedObjectContext;
    
    Shikaku *shikaku = [NSEntityDescription insertNewObjectForEntityForName:@"Shikaku"
                                                     inManagedObjectContext:managedObjectContext];
    shikaku.seqNo = [NSNumber numberWithInt:[self.seqNoField.text intValue]];
    shikaku.title = self.titleField.text;
    
    Gakusei *gakusei = (Gakusei *)self.detailItem;
    
    // RelationshipのNSSetオブジェクトに変更を与える場合には
    // mutableSetValueForKeyメソッドでRelationshipを指定する
    // 　（今回は１件単位の追加・削除なので以下の処理は不要）
    // NSMutableSet *shikakuHyo = [gakusei mutableSetValueForKey:@"shikakuHyo"];
    
    [gakusei addShikakuHyoObject:shikaku];
    
    [[CDDataManager sharedManager] save];
    
    // 自分自身でモーダルビューをdismissせずに呼び出し元のデリゲートメソッドでdismiss
    if ([self.delegate respondsToSelector:@selector(shikakuAdd)]) {
        [self.delegate shikakuAdd];
    }
    
    // [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
