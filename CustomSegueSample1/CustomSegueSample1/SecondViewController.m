//
//  SecondViewController.m
//  CustomSegueSample1
//
//  Created by 中川 聡 on 12/03/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    view = [self view];
            NSLog(@"pass1");
    NSLog(@"view = %@", view);
}

- (IBAction)back:(id)sender {

        NSLog(@"pass2");
    CGRect frame = view.frame;
        NSLog(@"pass3");
    frame.origin = CGPointMake(0, 100);
        NSLog(@"pass4");
    view.frame = frame;
    /*
    [UIView animateWithDuration:1.0
                     animations:^{
                         CGRect frame = view.frame;
                         frame.origin = CGPointMake(0, 480);
                         view.frame = frame;
                     }
                     completion:^(BOOL finished){
                         if (finished) {
                             //[[self sourceViewController] 
                             // presentModalViewController:[self destinationViewController] animated:NO];
                         }
                     }];
     */

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
