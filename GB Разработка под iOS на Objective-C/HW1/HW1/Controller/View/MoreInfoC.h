//
//  MoreInfo.h
//  HW1
//
//  Created by Кирилл Титов on 16.03.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheapestTicket.h"

NS_ASSUME_NONNULL_BEGIN

@interface MoreInfoC : UIViewController

@property (nonatomic, strong) CheapestTicket *cheapestTicket;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *toLabel;
@property (nonatomic, strong) UILabel *airlineLabel;
@property (nonatomic, strong) UILabel *flightNumberLabel;
@property (nonatomic, strong) UILabel *departureLabel;
@property (nonatomic, strong) UILabel *returnLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end

NS_ASSUME_NONNULL_END
