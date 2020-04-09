//
//  TicketCell.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 07.04.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *coastLabel;
@property (nonatomic, weak) IBOutlet UILabel *airlineLabel;
@property (nonatomic, weak) IBOutlet UILabel *destinationLabel;

- (void)setupCell:(NSNumber *)value destination:(NSString *)destination airline:(NSString *)airline;

@end

NS_ASSUME_NONNULL_END
