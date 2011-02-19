//
//  Annotation_ArraySampleMyAnnotation.h
//  Annotation_ArraySample
//
//  Created by 中川 聡 on 11/02/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface Annotation_ArraySampleMyAnnotation : NSObject <MKAnnotation> {
	
	CLLocationCoordinate2D	coordinate;
	NSString				*title;
	NSString				*subtitle;
	BOOL					isMyAnnotation;
	
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
