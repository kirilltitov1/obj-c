//
//  TicketsCollectionView.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 07.04.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketCell.h"
#import "Airports.h"
#import "CheapestTicket.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketsCollectionView : UICollectionViewController <UISearchBarDelegate>
@property (strong, nonatomic) NSMutableArray<CheapestTicket *>* cheapestTickets;
@property (strong, nonatomic) Airports *airports;

@end

NS_ASSUME_NONNULL_END
