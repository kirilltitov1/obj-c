//
//  LocationServices.m
//  CLGeocoder
//
//  Created by Кирилл Титов on 30.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import "LocationServices.h"

@implementation LocationServices

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = CLLocationManager.new;
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
    }
    return self;
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || \
        status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (!_currentLocation) {
        _currentLocation = locations.firstObject;
        [_locationManager stopUpdatingLocation];
        [[NSNotificationCenter defaultCenter] postNotificationName:kLocationServiseDidUpdateCurrentLocation object:_currentLocation];
    }
}


@end
