
//
//  MkAnnotationView.m
//  SampleMapViewExample5
//
//  Created by pro-tek on 3/1/16.
//  Copyright © 2016 pro-tek. All rights reserved.
//

#import "MkAnnotationView.h"

@implementation MkAnnotationView
@synthesize name,coordinate;


-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location{
    self = [super init];
    if (self) {
        name = newTitle;
        coordinate = location;
    }
    return self;
}



@end
