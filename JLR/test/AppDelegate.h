//
//  AppDelegate.h
//  test
//
//  Created by Sebastian Boldt on 07.03.13.
//  Copyright (c) 2013 LetsIDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) BOOL authenticated;

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@end
