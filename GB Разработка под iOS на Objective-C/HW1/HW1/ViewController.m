//
//  ViewController.m
//  HW1
//
//  Created by Kirill Titov on 16/02/2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor redColor];
        
        UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(20.f, 20.f, self.view.frame.size.width - 40.f, self.view.frame.size.height - 40.f)];
        newView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:newView];
        
        CGRect frame = CGRectMake(20, 20, 200.0, 50.0);
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Первый", @"Второй", @"Третий"]];
        segmentedControl.frame = frame;
        segmentedControl.tintColor = [UIColor blackColor];
        segmentedControl.selectedSegmentIndex = 0;
        [newView addSubview:segmentedControl];
        
        UISlider *slider = [[UISlider alloc] init];
        slider.frame = CGRectMake(20, 90, 200.0, 50.0);;
        slider.tintColor = [UIColor blackColor];
        slider.value = 0.5;
        [self.view addSubview:slider];
        
    }

    - (void)viewWillAppear:(BOOL)animated {
        [super viewWillAppear:animated];
        self.navigationController.hidesBarsOnTap = YES;

        
    }

    - (void)openAnotherViewController
    {
        UIViewController *anotherViewController = [[UIViewController alloc] init];
        anotherViewController.view.backgroundColor = [UIColor greenColor];
        
    //    // Используя контроллер навигации
        [self.navigationController showViewController:anotherViewController sender:self];
        
        self.navigationController.hidesBarsOnTap = NO;
    //    // или
    //    [self.navigationController pushViewController:anotherViewController animated:YES];
        
        // Модально
    //    [self presentViewController:anotherViewController animated:YES completion:nil];
}


@end
