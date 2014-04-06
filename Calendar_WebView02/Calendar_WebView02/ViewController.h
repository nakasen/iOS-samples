//
//  ViewController.h
//  Calendar_WebView02
//
//  Created by 中川 聡 on 12/01/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate> {    
    NSMutableArray *webViewArray;
    int indexNumber;
    int currentYear;
    int currentMonth;
    int prevYear;
    int prevMonth;
    int nextYear;
    int nextMonth;
}

- (void)setPrevNext;
- (void)swipeLeft;
- (void)swipeRight;
- (void)calendarSet:(int)year calendarMonth:(int)month setIndex:(int)index setLayout:(int)layout;

@end
