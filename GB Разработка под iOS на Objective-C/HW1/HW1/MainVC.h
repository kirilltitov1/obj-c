//
//  ViewController.h
//  HW1
//
//  Created by Kirill Titov on 16/02/2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController <UITableViewDataSource>

@property (strong, nonnull) UITableView* tableView;

@end

