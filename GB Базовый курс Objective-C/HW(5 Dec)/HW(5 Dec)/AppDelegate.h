//
//  AppDelegate.h
//  HW(5 Dec)
//
//  Created by Kirill Titov on 05/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

