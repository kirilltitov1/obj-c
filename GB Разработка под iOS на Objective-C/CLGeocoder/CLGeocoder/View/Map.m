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


- (MKAnnotationView *)viewForAnnotation:(id<MKAnnotation>)annotation {
    
    static NSString *identifire = @"marker";
    
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[self dequeueReusableAnnotationViewWithIdentifier:identifire];
    if (!annotationView) {
        annotationView = MKMarkerAnnotationView.new;
        annotationView.canShowCallout = YES;
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    return annotationView;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.coordinate = CLLocationCoordinate2DMake(55.7522200, 37.6155600);
        self.regionCoord = MKCoordinateRegionMakeWithDistance(_coordinate, 10000, 10000);
        self.initialLocation = [[CLLocation alloc] initWithLatitude:55.7522200 longitude:37.6155600];
        [self createAnnotatio];
    }
    return self;
}


- (void)createAnnotatio {
    self.annotation = MKPointAnnotation.new;
    _annotation.title = @"Title";
    _annotation.subtitle = @"Subtitle";
    _annotation.coordinate = _coordinate;
    [self addAnnotation:_annotation];
    self.region = _regionCoord;
}

@end
