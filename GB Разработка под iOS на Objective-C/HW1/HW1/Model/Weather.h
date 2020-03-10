//
//  News.h
//  HW1
//
//  Created by Кирилл Титов on 08.03.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

@property (nonatomic, strong) NSString* dt_txt;
@property (nonatomic, strong) NSString* temp;
@property (nonatomic, strong) NSString* feels_like;
@property (nonatomic, strong) NSString* temp_min;
@property (nonatomic, strong) NSString* temp_max;
@property (nonatomic, strong) NSString* pressure;
@property (nonatomic, strong) NSString* humidity;
@property (nonatomic, strong) NSString* desc;
@property (nonatomic, strong) NSNumber* windSpeed;

@end

NS_ASSUME_NONNULL_END
