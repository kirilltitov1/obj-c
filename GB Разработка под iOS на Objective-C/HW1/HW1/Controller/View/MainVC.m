//
//  ViewController.m
//  HW1
//
//  Created by Kirill Titov on 16/02/2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//        self.view.backgroundColor = [UIColor redColor];
    }

    - (void)viewWillAppear:(BOOL)animated {
        [super viewWillAppear:animated];
        self.navigationController.hidesBarsOnTap = YES;
    }

@end
