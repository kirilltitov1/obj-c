//
//  Map.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 27.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Map : MKMapView <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) MKCoordinateRegion regionCoord;
@property (nonatomic) MKPointAnnotation *annotation;
@property (nonatomic) CLLocation *initialLocation;

@end

NS_ASSUME_NONNULL_END
