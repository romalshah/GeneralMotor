//
//  MapViewController.m
//  RomalAssessment
//
//  Created by romal on 7/20/16.
//  Copyright © 2016 romal. All rights reserved.
//

#import "MapViewController.h"
#import "MkAnnotationView.h"

@interface MapViewController (){
    MkAnnotationView *Annotations;
    MKCoordinateRegion region;

}

@end

@implementation MapViewController
@synthesize locationArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapView.delegate =self;
    
    [self.mapView addAnnotations:[self createAnnotations]];
    
}
-(NSMutableArray *)createAnnotations

{
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    
    //Read locations details from plist
    
    NSInteger counter=0;
        for (NSDictionary *row in locationArray) {
        
            NSString *latStr = [row objectForKey:@"Latitude"];
            NSString *lonStr = [row objectForKey:@"Longitude"];
        
        NSString *title = @"title";
        
        //Create coordinates from the latitude and longitude values
            CLLocationCoordinate2D coord;
            
            coord.latitude =latStr.doubleValue;
            
            coord.longitude =lonStr.doubleValue;
            if(_selectedIndex==counter){
               
                MKCoordinateSpan span;
                span.latitudeDelta = 0.005;
                span.longitudeDelta = 0.005;
                region.span = span;
                region.center = coord;
                [_mapView setRegion:region animated:YES];
            }
       
        MkAnnotationView *annotation = [[MkAnnotationView alloc]initWithTitle:title Location:coord];
        
        [annotations addObject:annotation];
            counter++;
    }
    
    return annotations;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
