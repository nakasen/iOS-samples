//
//  ViewController.m
//  Calendar_WebView02
//
//  Created by 中川 聡 on 12/01/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

int zeller(int year, int month, int day);
BOOL isLeapYear(int year);


@implementation ViewController

int zeller(int year, int month, int day){
    int zyear, zmonth, startday;
    if (month == 1 || month == 2) {
        zyear = year;
        zyear--;
        zmonth = month;
        zmonth += 12;
    } else {
        zyear = year;
        zmonth = month;
    }
    startday = (zyear + (int)(zyear / 4) - (int)(zyear / 100) + (int)(zyear / 400) + (int)((13 * zmonth + 8) / 5) + day) % 7;
    return startday;
}

BOOL isLeapYear(int year){
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
        return YES;
    } else {
        return NO;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *swipeGestureLeft =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeGestureLeft.delegate = self;
    [self.view addGestureRecognizer:swipeGestureLeft];
    
    UISwipeGestureRecognizer *swipeGestureRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    swipeGestureRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeGestureRight.delegate = self;
    [self.view addGestureRecognizer:swipeGestureRight];
    
    webViewArray = [[[NSMutableArray alloc] initWithObjects:@"nil", @"nil", @"nil", nil] autorelease];
    [webViewArray retain];
    
    NSDate *now = [NSDate date];
    NSCalendar *myCalendar = [NSCalendar currentCalendar];
    NSCalendarUnit myCalendarUnit = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *myComponents = [myCalendar components:myCalendarUnit fromDate:now];
    
    currentYear = [myComponents year];
    currentMonth = [myComponents month];
    [self setPrevNext];

    [self calendarSet:currentYear calendarMonth:currentMonth setIndex:1 setLayout:1];
    [self calendarSet:prevYear calendarMonth:prevMonth setIndex:0 setLayout:0];
    [self calendarSet:nextYear calendarMonth:nextMonth setIndex:2 setLayout:2];
    
    indexNumber = 1;
}

- (void)setPrevNext {
    if (currentMonth == 1) {
        prevYear = currentYear - 1;
        prevMonth = 12;
    } else {
        prevYear = currentYear;
        prevMonth = currentMonth - 1;
    }
    if (currentMonth == 12) {
        nextYear = currentYear + 1;
        nextMonth = 1;
    } else {
        nextYear = currentYear;
        nextMonth = currentMonth + 1;
    }
}

- (void)calendarSet:(int)year calendarMonth:(int)month setIndex:(int)index setLayout:(int)layout {
    UIWebView *tempWebView = [[[UIWebView alloc] initWithFrame:CGRectMake((layout - 1) * 320, 0, 320, 460)] autorelease];
    [self.view addSubview:tempWebView];
    
    NSMutableString *htmlString = [[[NSMutableString alloc] init] autorelease];
    
    [htmlString appendString:@"<html>"
     "<head>"
     "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"
     "<title>Calendar</title>"
     "<style type=\"text/css\">"
     "<!--"
     "body {"
     "       background-color: #000000;"
     "       color: #FFFFFF;"
     "       font-family: helvetica;"
     "}"
     "th {"
     "       text-align: right;"
     "}"
     "td {"
     "       width: 35px;"
     "       text-align: right;"
     "}"
     ".red {"
     "       color: #FF0000;"
     "}"
     ".blue {"
     "       color: #0000FF;"
     "}"
     "-->"
     "</style>"
     "</head>"
     "<body>"
     "<table border=\"0\">"
     "<tr>"
     "<td colspan=\"2\">　</td>"
     "<td colspan=\"3\">"];
    
    [htmlString appendString:[NSString stringWithFormat:@"%d年　%d月", year, month]];
    [htmlString appendString:@"</td><tr></tr><tr></tr>"
     "<td colspan=\"2\">　</td>"
     "</tr>"
     "<tr>"];
    [htmlString appendString:@"<th class=\"red\">Sun</th>"
     "<th>Mon</th>"
     "<th>Tue</th>"
     "<th>Wed</th>"
     "<th>Thu</th>"
     "<th>Fri</th>"
     "<th class=\"blue\">Sat</th>"
     "</tr>"
     "<tr>"];
    
    int monthdays[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    
    int thismonthdays = monthdays[month - 1];
    if (isLeapYear(year) && month == 2){
        thismonthdays++;
    }
    
    int startday = zeller(year, month, 1);
    int wcount = 0;
    
    for (int i = 0; i < startday; i++){
        [htmlString appendString:@"<td>　</td>"];
        wcount++;
    }
    for (int i = 1; i <= thismonthdays; i++){
        [htmlString appendString:@"<td"];
        if (wcount == 0) {
            [htmlString appendString:@" class=\"red\""];
        } else if (wcount == 6) {
            [htmlString appendString:@" class=\"blue\""];
        }
        [htmlString appendString:[NSString stringWithFormat:@">%d</td>", i]];
        wcount++;
        if (wcount > 6){
            [htmlString appendString:@"</tr><tr>"];
            wcount = 0;
        }
    }
    if (wcount != 0){
        for (int i = wcount; i < 7 ; i++){
            [htmlString appendString:@"<td>　</td>"];
        }
    }

    [tempWebView loadHTMLString:htmlString baseURL:nil];
    [webViewArray replaceObjectAtIndex:index withObject:tempWebView];
}

- (void)swipeLeft {
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options:UIViewAnimationTransitionNone
                     animations:^{
                         [[webViewArray objectAtIndex:indexNumber % 3] setFrame:CGRectMake(-320, 0, 320, 460)];
                         [[webViewArray objectAtIndex:(indexNumber + 1) % 3] setFrame:CGRectMake(0, 0, 320, 460)];
                     }
                     completion:^(BOOL finished){
                         currentYear = nextYear;
                         currentMonth = nextMonth;
                         [self setPrevNext];
                         indexNumber++;
                         if (indexNumber > 2) {
                             indexNumber = 0;
                         }
                         [[webViewArray objectAtIndex:(indexNumber + 1) % 3] removeFromSuperview];
                         [self calendarSet:nextYear calendarMonth:nextMonth setIndex:(indexNumber + 1) % 3 setLayout:2];
                     }];
}

- (void)swipeRight {
    [UIView animateWithDuration:0.2
                          delay:0.1
                        options:UIViewAnimationTransitionNone
                     animations:^{
                         [[webViewArray objectAtIndex:indexNumber % 3] setFrame:CGRectMake(320, 0, 320, 460)];
                         [[webViewArray objectAtIndex:(indexNumber + 2) % 3] setFrame:CGRectMake(0, 0, 320, 460)];
                     }
                     completion:^(BOOL finished){
                         currentYear = prevYear;
                         currentMonth = prevMonth;
                         [self setPrevNext];
                         indexNumber--;
                         if (indexNumber < 0) {
                             indexNumber = 2;
                         }
                         [[webViewArray objectAtIndex:(indexNumber + 2) % 3] removeFromSuperview];
                         [self calendarSet:prevYear calendarMonth:prevMonth setIndex:(indexNumber + 2) % 3 setLayout:0];
                     }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
