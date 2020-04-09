//
//  CollectionReusableView.h
//  CLGeocoder
//
//  Created by Кирилл Титов on 09.04.2020.
//  Copyright © 2020 Кирилл Титов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchBar : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

NS_ASSUME_NONNULL_END
