//
//  PropertySampleViewController.m
//  PropertySample
//
//  Created by 中川 聡 on 11/02/27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@implementation PropertySampleViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
	
	MyClass *myClass = [[[MyClass alloc] init] autorelease];

	myClass.myString = @" cokon-i"; // as a setter
	
	UILabel *myLabel1 = [[[UILabel alloc] initWithFrame:CGRectMake(40, 100, 240, 50)] autorelease];
	myLabel1.text = myClass.myString; // as a getter
	
	[self.view addSubview:myLabel1];
	
	
	myClass.myString = @" at Omotesando"; // as a setter
	
	UILabel *myLabel2 = [[[UILabel alloc] initWithFrame:CGRectMake(40, 200, 240, 50)] autorelease];
	myLabel2.text = myClass.myString; // as a getter
	
	[self.view addSubview:myLabel2];
	
	
	
	

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
