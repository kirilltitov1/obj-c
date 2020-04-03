//
//  Map.m
//  CLGeocoder
//
//  Created by Кирилл Титов on 27.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import "Map.h"

@implementation Map


- (void)drawRect:(CGRect)rect {
    self.delegate = self;
    
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifire = @"marker";
    
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[self dequeueReusableAnnotationViewWithIdentifier:identifire];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifire];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    
    return annotationView;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
        self.regionCoord = MKCoordinateRegionMakeWithDistance(_coordinate, 10000, 10000);
        self.initialLocation = [[CLLocation alloc] initWithLatitude:55.7522200 longitude:37.6155600];
        self.region = _regionCoord;
        
        [self createAnnotatio];
//        [self startLocation];
    }
    return self;
}


- (void)createAnnotatio {
    self.annotation = MKPointAnnotation.new;
    _annotation.title = @"Title";
    _annotation.subtitle = @"Subtitle";
    _annotation.coordinate = _coordinate;
    [self addAnnotation:_annotation];
    
//    CLLocation *location = [[CLLocation alloc] initWithCoordinate:_coordinate altitude:0 horizontalAccuracy:kCLLocationAccuracyBestForNavigation verticalAccuracy:kCLLocationAccuracyBestForNavigation timestamp:[NSDate date]];
//    [self addressFromLocation:location];
}


//- (void) addressFromLocation:(CLLocation *) location {
//    CLGeocoder *geocoder = CLGeocoder.new;
//    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
//        if (placemarks > 0) {
//            for (MKPlacemark *placemark in placemarks) {
//                NSLog(@"%@", placemark);
//            }
//        }
//    }];
//    return;
//}


//- (void)startLocation {
//    CLLocationManager *locationMannager = CLLocationManager.new;
//    locationMannager.delegate = self;
//    locationMannager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
//    locationMannager.distanceFilter = 10;
//    [locationMannager requestWhenInUseAuthorization];
//
//    [locationMannager stopUpdatingLocation];
//}

//- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    CLLocation *location = [locations firstObject];
//    if (location) {
//        NSLog(@"%@", location);
//    }
//}

@end
