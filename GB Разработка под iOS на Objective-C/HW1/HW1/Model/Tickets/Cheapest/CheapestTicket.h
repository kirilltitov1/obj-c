//
//  News.h
//  HW1
//
//  Created by Кирилл Титов on 08.03.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CheapestTicket : NSObject

@property (nonatomic, strong) NSNumber* price;
@property (nonatomic, strong) NSString* airline;
@property (nonatomic, strong) NSString* flight_number;
@property (nonatomic, strong) NSDate* departure_at;
@property (nonatomic, strong) NSDate* return_at;
@property (nonatomic, strong) NSDate* expires_at;

@end

NS_ASSUME_NONNULL_END
