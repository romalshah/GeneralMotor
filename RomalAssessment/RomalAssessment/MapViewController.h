//
//  MapViewController.h
//  RomalAssessment
//
//  Created by Pro-tek on 7/20/16.
//  Copyright © 2016 romal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController<MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSMutableArray *locationArray;
@property (nonatomic) NSInteger selectedIndex;
@end
