//
//  CameraOverlayViewSampleViewController.m
//  CameraOverlayViewSample
//
//  Created by 中川 聡 on 11/02/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@implementation CameraOverlayViewSampleViewController



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
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	
	//ここから上部ツールバー	
	UIToolbar *toolbar1 = [[[UIToolbar alloc] init] autorelease];
	toolbar1.barStyle = UIBarStyleDefault;
    [toolbar1 sizeToFit];
	toolbar1.frame = CGRectMake(0, 0, 320, 44);
	toolbar1.barStyle = UIBarStyleBlackOpaque;
	
	//カメラボタン
	UIBarButtonItem *cameraButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
																				   target:self
																				   action:@selector(cameraButtonAction)] autorelease];
	//スペーサー
	UIBarButtonItem *spacer = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																			 target:nil
																			 action:nil] autorelease];	

	//バーにボタンを配置
	NSArray *toolBarButtons1 = [NSArray arrayWithObjects:spacer, cameraButton, nil];
	
	[toolbar1 setItems:toolBarButtons1 animated:NO];
	[self.view addSubview:toolbar1];
	
	//カメラボタンはハード的に使える時のみ有効
	cameraButton.enabled =
	[UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}


- (void)cameraButtonAction {
	if (picker == nil) {
		picker = [[UIImagePickerController alloc] init];
	}
	picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	picker.showsCameraControls = NO;
	picker.cameraOverlayView.userInteractionEnabled = NO;
	
	UIImage *buttonViewImage = [UIImage imageNamed:@"GoogleBadge"];
	//buttonView.center = CGPointMake(240, 320);
	
	UIButton *backButton = [[[UIButton alloc] initWithFrame:CGRectMake(100, 100, 138, 46)] autorelease];
	[backButton setBackgroundImage:buttonViewImage forState:UIControlStateNormal];
	
	[backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
	
	picker.cameraOverlayView = backButton;
	
	[self presentModalViewController:picker animated:YES];
}


- (void)backButtonAction {
	[picker dismissModalViewControllerAnimated:YES];
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
	[picker release], picker = nil;
    [super dealloc];
}

@end
