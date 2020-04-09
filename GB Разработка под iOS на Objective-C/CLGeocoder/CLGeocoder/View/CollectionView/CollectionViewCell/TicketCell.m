//
//  TicketCell.m
//  CLGeocoder
//
//  Created by Кирилл Титов on 07.04.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import "TicketCell.h"

@implementation TicketCell

- (void)setupCell:(NSNumber *)value destination:(NSString *)destination airline:(NSString *)airline {
    [self setCoast:value];
    [self setDestination:destination];
    [self setAirline:airline];
}

- (void)setCoast:(NSNumber *)value {
    _coastLabel.text = [[NSString alloc] initWithFormat:@"%@", value];
}

- (void)setDestination:(NSString *)destination {
    _destinationLabel.text = destination;
}

- (void)setAirline:(NSString *)airline {
    _airlineLabel.text = airline;
}

@end
