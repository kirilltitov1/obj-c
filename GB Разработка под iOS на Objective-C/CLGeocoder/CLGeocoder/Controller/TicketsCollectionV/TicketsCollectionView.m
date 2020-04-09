//
//  TicketsCollectionView.m
//  CLGeocoder
//
//  Created by Кирилл Титов on 07.04.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import "TicketsCollectionView.h"

@interface TicketsCollectionView ()

@property (nonatomic, strong) NSMutableArray<CheapestTicket *>* searchCheapestTickets;

@end

@implementation TicketsCollectionView

static NSString * const reuseIdentifier = @"ticketCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airports = Airports.new;
    [self fetchNewsUsingJSON];
}

- (void)customization {
    
}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cheapestTickets.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TicketCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ticketCell" forIndexPath:indexPath];
    
    [cell setupCell:_cheapestTickets[indexPath.row].price destination:_airports.HKT airline:_cheapestTickets[indexPath.row].airline];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat aside = ([UIScreen mainScreen].bounds.size.width - 24)/2;
    CGSize frame = CGSizeMake(aside, aside);

    return frame;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *searchBar = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"searchBar" forIndexPath:indexPath];
    return searchBar;
}

#pragma mark download data

NSInteger alphabeticSort(id string1, id string2, void *reverse)
{
    if (*(BOOL *)reverse == YES) {
        return [string2 localizedStandardCompare:string1];
    }
    return [string1 localizedStandardCompare:string2];
}

- (void) fetchNewsUsingJSON {
    NSString* apiKey = @"7e22896b9b8af259d2879e0ab6911c42";
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@%@",@"https://api.travelpayouts.com/v1/prices/cheap?origin=MOW&destination=", self.airports.HKT, @"&depart_date=2020-05&return_date=2020-05&token=", apiKey];
    NSURL* url = [NSURL URLWithString:urlString];
     
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError* err = error;
        if (err) {
            NSLog(@"%@", err);
            return;
        }
        
        NSMutableArray *cheapestTickets = NSMutableArray.new;

        NSDictionary *dataJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        NSDictionary *airportsDict = dataJSON[@"data"];
        
        NSDictionary *airportDict = airportsDict[@"HKT"];
        
        BOOL reverseSort = NO;
        NSArray *keys = [airportDict.allKeys sortedArrayUsingFunction:alphabeticSort context:&reverseSort];
        
        for (NSString *key in keys) {
            NSDateFormatter *isoFormat = NSDateFormatter.new;
            [isoFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
            isoFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
            
            NSDictionary *ticketDict = airportDict[key];
            CheapestTicket *cheapestTicket = CheapestTicket.new;
            cheapestTicket.price = ticketDict[@"price"];
            cheapestTicket.airline = ticketDict[@"airline"];
            cheapestTicket.flight_number = ticketDict[@"flight_number"];
            
            NSDate *parsedDate = [isoFormat dateFromString:ticketDict[@"departure_at"]];
            
            cheapestTicket.departure_at = parsedDate;
            parsedDate = [isoFormat dateFromString:ticketDict[@"return_at"]];
            cheapestTicket.return_at = parsedDate;
            parsedDate = [isoFormat dateFromString:ticketDict[@"expires_at"]];
            cheapestTicket.expires_at = parsedDate;
            
            [cheapestTickets addObject:cheapestTicket];
        }
        
        self.cheapestTickets = cheapestTickets;
        self.searchCheapestTickets = NSMutableArray.new;
        [self.searchCheapestTickets addObjectsFromArray:self.cheapestTickets];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }] resume];
}

#pragma mark <UISearchBarDelegate>
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_cheapestTickets removeAllObjects];
    
    for (CheapestTicket *item in _searchCheapestTickets) {
        if ([item.airline.lowercaseString containsString:searchBar.text.lowercaseString]) {
            [self.cheapestTickets addObject:item];
            
            [self.collectionView reloadData];
        }
    }
    if ([searchBar.text isEqualToString:@""]) {
        self.cheapestTickets = self.searchCheapestTickets;
        [self.collectionView reloadData];
    }
}


@end
