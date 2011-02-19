//
//  AnnotationSampleMyAnnotation.m
//  AnnotationSample
//
//  Created by 中川 聡 on 11/01/20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@implementation AnnotationSampleMyAnnotation

@synthesize	coordinate, title, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	coordinate = coord;
	isMyAnnotation = YES;
	return self;
}

@end
