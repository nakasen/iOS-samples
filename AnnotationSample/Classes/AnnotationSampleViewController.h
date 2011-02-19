//
//  AnnotationSampleViewController.h
//  AnnotationSample
//
//  Created by 中川 聡 on 11/01/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface AnnotationSampleViewController : UIViewController <MKMapViewDelegate> {
	
	MKMapView *mapView;
	
	CGPoint viewCenterPoint;

}

@end

