//
//  main.m
//  HW(5 Dec)
//
//  Created by Kirill Titov on 05/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    } 
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
