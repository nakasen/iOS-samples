//
//  SharedSampleViewController.m
//  SharedSample
//
//  Created by 中川 聡 on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SharedSampleViewController.h"


@implementation SharedSampleViewController


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    textView = [[UITextView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    textView.text = [[NSString alloc] initWithFormat:@"%d", appDelegate.myClass.sharedVal];
    [self.view addSubview:textView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
