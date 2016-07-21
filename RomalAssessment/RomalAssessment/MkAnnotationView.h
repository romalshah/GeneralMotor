//
//  MkAnnotationView.h
//  SampleMapViewExample5
//
//  Created by pro-tek on 3/1/16.
//  Copyright © 2016 pro-tek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MkAnnotationView : NSObject<MKAnnotation>
@property(nonatomic,copy) NSString* name;

@property(nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id)initWithTitle:(NSString *)newTitle Location:(CLLocationCoordinate2D)location;



@end
