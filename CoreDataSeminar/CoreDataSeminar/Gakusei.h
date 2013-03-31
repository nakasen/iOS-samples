//
//  Gakusei.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Gakusei : NSManagedObject

@property (nonatomic, retain) NSString *gakusekiNo;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSSet *shikakuHyo;

@end


@interface Gakusei (CoreDataGeneratedAccessors)

- (void)addShikakuHyoObject:(NSManagedObject *)value;
- (void)removeShikakuHyoObject:(NSManagedObject *)value;
- (void)addShikakuHyo:(NSSet *)values;
- (void)removeShikakuHyo:(NSSet *)values;

@end
