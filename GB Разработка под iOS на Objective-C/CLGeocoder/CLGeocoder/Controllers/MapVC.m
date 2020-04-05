//
//  MapVC.m
//  CLGeocoder
//
//  Created by Кирилл Титов on 27.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import "MapVC.h"

@interface MapVC ()

@property (weak, nonatomic) IBOutlet MKMapView *map_main;


@end

@implementation MapVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createAnnotation:) name:kLocationManagerDidUpdateCurrentLoaction object:nil];
    
    [self checkLocationServices];
}

#pragma mark - init whit coder
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _locationManager = CLLocationManager.new;
        _regionDistance = 10000;
    }
    return self;
}

#pragma mark - loaction
- (void)setupLocationManager {
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
}

- (void)centerViewOnUserLocation {
    CLLocationCoordinate2D location = _locationManager.location.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location, _regionDistance, _regionDistance);
    [_map_main setRegion:region animated:YES];
}

- (void)checkLocationServices {
    if (CLLocationManager.locationServicesEnabled) {
        [self setupLocationManager];
        [self checkLocationAuthorization];
    } else {
//  make alert to show about error
    }
}

- (void)checkLocationAuthorization {
    switch (CLLocationManager.authorizationStatus) {
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            _map_main.showsUserLocation = YES;
            [self centerViewOnUserLocation];
            [_locationManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
//           make alert about permision
            break;
        case kCLAuthorizationStatusNotDetermined:
            [_locationManager requestWhenInUseAuthorization];
        case kCLAuthorizationStatusRestricted:
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            break;
            
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *currentLocation = [locations firstObject];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, _regionDistance, _regionDistance);
    [_map_main setRegion:region animated:YES];
    [_locationManager stopUpdatingLocation];
    [[NSNotificationCenter defaultCenter] postNotificationName:kLocationManagerDidUpdateCurrentLoaction object:currentLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    [self checkLocationAuthorization];
}

#pragma mark - annotations
- (void)createAnnotation: (NSNotification *) notification {
    self.annotation = MKPointAnnotation.new;
    CLLocation *coordinate = notification.object;
    _annotation.title = @"Title";
    _annotation.subtitle = @"Subtitle";
    _annotation.coordinate = CLLocationCoordinate2DMake(coordinate.coordinate.latitude, coordinate.coordinate.longitude);
    [_map_main addAnnotation:_annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifire = @"marker";
    
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[_map_main dequeueReusableAnnotationViewWithIdentifier:identifire];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifire];
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

