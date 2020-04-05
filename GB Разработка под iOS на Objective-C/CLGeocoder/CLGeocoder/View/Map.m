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
    [self initLocationService];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiseDidUpdateCurrentLocation object:nil];
    [self createAnnotatio];
}

#pragma mark - init
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initLocationService];
        self.showsUserLocation = YES;
        self.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
        self.regionCoord = MKCoordinateRegionMakeWithDistance(_coordinate, 10000, 10000);
        self.initialLocation = [[CLLocation alloc] initWithLatitude:55.7522200 longitude:37.6155600];
    }
    return self;
}

#pragma mark - annotations
- (void)createAnnotatio {
    self.annotation = MKPointAnnotation.new;
    _annotation.title = @"Title";
    _annotation.subtitle = @"Subtitle";
    _annotation.coordinate = _coordinate;
    [self addAnnotation:_annotation];
}

#pragma mark - delegate methods
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

- (void)initLocationService {
    _locationServise = LocationServices.new;
}

- (void)updateCurrentLocation: (NSNotification *) notification {
    CLLocation *currentLocation = notification.object;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 10000, 10000);
    [self setRegion:region animated:NO];
}


@end
