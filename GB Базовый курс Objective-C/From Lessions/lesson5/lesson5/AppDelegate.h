//
//  AppDelegate.h
//  lesson5
//
//  Created by Kirill Titov on 16/01/2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

