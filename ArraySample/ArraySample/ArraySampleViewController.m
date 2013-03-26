//
//  ArraySampleViewController.m
//  ArraySample
//
//  Created by 中川 聡 on 11/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ArraySampleViewController.h"

@implementation ArraySampleViewController

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
    UIImage *buttonViewImage[5];
    for (int i = 0; i < 5; i++) {
        buttonViewImage[i] = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"frame%d.png", i]];
    }
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
