//
//  Shikaku.h
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class Gakusei;


@interface Shikaku : NSManagedObject

@property (nonatomic, retain) NSNumber *seqNo;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) Gakusei *gakusei;

@end
