//
//  MapVC.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 27.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kLocationManagerDidUpdateCurrentLoaction @"LocationManagerDidUpdateCurrentLoaction"

@interface MapVC : UIViewController

@end

@interface MapVC () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) double regionDistance;

@property (nonatomic) MKPointAnnotation *annotation;
@end

NS_ASSUME_NONNULL_END
