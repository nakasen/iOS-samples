//
//  CDDataManager.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDDataManager : NSObject

@property (nonatomic, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, readonly) NSPersistentStore *sqlPersistentStore;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

+ (CDDataManager *)sharedManager;

- (NSManagedObjectContext *)createManagedObjectContext;
- (void)save;

@end