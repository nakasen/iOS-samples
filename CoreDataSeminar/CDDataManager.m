//
//  CDDataManager.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "CDDataManager.h"


@implementation CDDataManager

@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize sqlPersistentStore = _sqlPersistentStore;
@synthesize managedObjectContext = _managedObjectContext;

// ************************************************************
// 　以下の３つのメソッドが典型的なシングルトンオブジェクトの生成パターン
// 　マルチスレッド下でもシングルトンが保証される
// 　initメソッドを上書きすることによって[[〜 alloc] init]で
// 　別インスタンスが生成されることを防いでいる
// 　　（ただし今回のCoreDataにおいては
// 　　　NSManagedObjectContextクラスのオブジェクトが
// 　　　スレッドフリーではないため別の対策も必要）
// ************************************************************

+ (CDDataManager *)sharedManager
{
    static CDDataManager *_sharedManager = nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CDDataManager alloc] initSharedManager];
    });
    
    return _sharedManager;
}

- (id)initSharedManager
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    NSLog(@"Error : CDDataManager initialize error. Use sharedManager class method.");
    return nil;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *momdUrl = [[NSBundle mainBundle] URLForResource:@"MainModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:momdUrl];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:self.managedObjectModel];
    
    NSURL *localUrl = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                              inDomains:NSUserDomainMask] lastObject];
    localUrl = [localUrl URLByAppendingPathComponent:@"CoreDataSeminar.sqlite"];
    
    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                                    [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                                    nil];
    
    NSError *error = nil;
    _sqlPersistentStore = [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                        configuration:nil
                                                                                  URL:localUrl
                                                                              options:options
                                                                                error:&error];
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    _managedObjectContext = [self createManagedObjectContext];
    
    return _managedObjectContext;
}

- (NSManagedObjectContext *)createManagedObjectContext
{
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:self.persistentStoreCoordinator];
    
    return managedObjectContext;
}

- (void)save
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end