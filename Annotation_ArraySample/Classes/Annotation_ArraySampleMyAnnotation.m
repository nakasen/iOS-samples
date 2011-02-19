//
//  Annotation_ArraySampleMyAnnotation.m
//  Annotation_ArraySample
//
//  Created by 中川 聡 on 11/02/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@implementation Annotation_ArraySampleMyAnnotation

@synthesize	coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	coordinate = coord;
	isMyAnnotation = YES;
	return self;
}

@end
