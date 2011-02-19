//
//  AnnotationSampleViewController.m
//  AnnotationSample
//
//  Created by 中川 聡 on 11/01/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@implementation AnnotationSampleViewController



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
	
	viewCenterPoint = CGPointMake(160, 213);
	
	mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 640, 640)];
	mapView.center = viewCenterPoint;
	
	mapView.delegate = self;
	mapView.showsUserLocation = YES;
	
	MKCoordinateRegion reg;
	CLLocationCoordinate2D cord;
	MKCoordinateSpan span;
	
	// Tokyo Station
	cord.latitude = 35.681382;
	cord.longitude = 139.766084;
	span.latitudeDelta = 0.01;
	span.longitudeDelta = 0.01;
	
	reg.center = cord;
	reg.span = span;
	mapView.region = reg;
	
	[self.view addSubview:mapView];
	
	AnnotationSampleMyAnnotation *annotation = [[AnnotationSampleMyAnnotation alloc] initWithCoordinate:cord];
	annotation.title = @"Tokyo Station";
	annotation.subtitle = @"Sample Annotation";
    
    [mapView addAnnotation:annotation];
	
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
	if (annotation == mapView.userLocation) {
		return nil;
	}
	
	MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"test"];
	
	[annotationView setPinColor:MKPinAnnotationColorGreen];
	[annotationView setCanShowCallout:YES];
	[annotationView setAnimatesDrop:YES];
	[annotationView setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
	
	annotationView.annotation = annotation;
	
	return annotationView;
	
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
	[mapView release];
    [super dealloc];
}

@end
