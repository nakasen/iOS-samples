//
//  AnnotationSampleMyAnnotation.h
//  AnnotationSample
//
//  Created by 中川 聡 on 11/01/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface AnnotationSampleMyAnnotation : NSObject <MKAnnotation> {

	CLLocationCoordinate2D	coordinate;
	NSString				*title;
	NSString				*subtitle;
	BOOL					isMyAnnotation;
	
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
