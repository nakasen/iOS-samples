//
//  Annotation_ArraySampleViewController.m
//  Annotation_ArraySample
//
//  Created by 中川 聡 on 11/02/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@implementation Annotation_ArraySampleViewController



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
	span.latitudeDelta = 0.05;
	span.longitudeDelta = 0.05;
	
	reg.center = cord;
	reg.span = span;
	mapView.region = reg;
	
	[self.view addSubview:mapView];
	
	//ここから配列
	
	NSMutableArray *myArray = [[NSMutableArray array] retain]; //配列全体枠を確保
	NSDictionary *myAnnotation; //１件分の枠
	
	myAnnotation = [NSDictionary dictionaryWithObjectsAndKeys: //１件目　東京駅
					[NSNumber numberWithDouble:35.681382], @"latitude", 
					[NSNumber numberWithDouble:139.766084], @"longitude", 
					[NSDate date], @"date", 
					@"Tokyo Station", @"memo", 
					nil];
	[myArray addObject:myAnnotation]; //配列に追加
	
	myAnnotation = [NSDictionary dictionaryWithObjectsAndKeys: //２件目　神田駅
					[NSNumber numberWithDouble:35.69169], @"latitude", 
					[NSNumber numberWithDouble:139.770883], @"longitude", 
					[NSDate date], @"date", 
					@"Kanda Station", @"memo", 
					nil];
	[myArray addObject:myAnnotation]; //配列に追加
	
	myAnnotation = [NSDictionary dictionaryWithObjectsAndKeys: //３件目　お茶の水駅
					[NSNumber numberWithDouble:35.699855], @"latitude", 
					[NSNumber numberWithDouble:139.763786], @"longitude", 
					[NSDate date], @"date", 
					@"Ochanomizu Station", @"memo", 
					nil];
	[myArray addObject:myAnnotation]; //配列に追加
	
	//ここから配列読み出し
	
	for (NSDictionary *myDictionary in myArray) {
		CLLocationCoordinate2D myCoordinate;
		myCoordinate.latitude = [[myDictionary objectForKey:@"latitude"] doubleValue];
		myCoordinate.longitude = [[myDictionary objectForKey:@"longitude"] doubleValue];
		
		Annotation_ArraySampleMyAnnotation *annotation = [[Annotation_ArraySampleMyAnnotation alloc] initWithCoordinate:myCoordinate];
		annotation.title = (NSString *)[myDictionary objectForKey:@"memo"];
    
		[mapView addAnnotation:annotation];
	}
	
}


- (MKAnnotationView *)mapView:(MKMapView *)myMapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
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
    [super dealloc];
}

@end
