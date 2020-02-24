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
        self.view.backgroundColor = [UIColor redColor];
        
        
        
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



- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	UITableViewCell* cell;
	
	return cell;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder { 
	return;
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection { 
	return;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 
	return;
}

//- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
//	<#code#>
//}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container { 
	return;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
	return;
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator { 
	return;
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator { 
	return;
}

- (void)setNeedsFocusUpdate { 
	return;
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context { 
	return NO;
}

- (void)updateFocusIfNeeded { 
	return;
}

@end
