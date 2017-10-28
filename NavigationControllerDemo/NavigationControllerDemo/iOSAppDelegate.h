//
//  iOSAppDelegate.h
//  NavigationControllerDemo
//
//  Created by Arthur Knopper on 279//12.
//  Copyright (c) 2012 iOSCreator. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iOSRootViewController;

@interface iOSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) iOSRootViewController *rootViewController;

@property (strong, nonatomic) UINavigationController *navigationController;



@end
