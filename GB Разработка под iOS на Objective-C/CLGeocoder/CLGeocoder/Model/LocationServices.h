//
//  LocationServices.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 30.03.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define kLocationServiseDidUpdateCurrentLocation @""

NS_ASSUME_NONNULL_BEGIN

@interface LocationServices : NSObject

@end

@interface LocationServices () <CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@end

NS_ASSUME_NONNULL_END
