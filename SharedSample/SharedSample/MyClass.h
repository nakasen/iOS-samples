//
//  MyClass.h
//  SharedSample
//
//  Created by 中川 聡 on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SharedSampleViewController;

@interface MyClass : NSObject {
    int sharedVal;
}

@property (nonatomic, assign) int sharedVal;

@end
