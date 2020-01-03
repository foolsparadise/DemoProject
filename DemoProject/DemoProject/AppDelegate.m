//
//  AppDelegate.m
//  DemoProject
//
//  Created by foolsparadise on 24/10/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AppDelegate.h"
#import "AppRootViewController.h"
#import "TabBarDemoViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

//////////////////////////////////////////////////////////////////////////////
    if (@available(iOS 13, *)) {
        // only run in >= iOS 13
        if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            //[@"DarkMode"];
        }
        else {
            //@"LightMode"];
        }
    }
    else {
        // < iOS 13 run init
    }
    
//////////////////////////////////////////////////////////////////////////////
    /* 
    // 1, use 1 viewcontroller
    UIViewController *rootVC = .....
    UINavigationController *rootNav  = [[UINavigationController alloc] initWithRootViewController: rootVC];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    self.window.rootViewController = rootNav;
    [self.window addSubview:self.window.rootViewController.view];
    [self.window makeKeyAndVisible];
    */
//////////////////////////////////////////////////////////////////////////////
    /*
    // 2, use 1 tabcontroller
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];

    TabBarDemoViewController *vc1 = [[TabBarDemoViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.tabBarItem.badgeValue = @"23";
    vc1.title = @"Home";
    vc1.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_home",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_home"];
    vc1.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_home_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_home_selected"];

    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor cyanColor];
    vc2.tabBarItem.badgeValue = @"1";
    vc2.title = @"Message";
    vc2.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_message_center",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_message_center"];
    vc2.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_message_center_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_message_center_selected"];

    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor redColor];
    vc3.title = @"Discover";
    vc3.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_discover",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_discover"];
    vc3.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_discover_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_discover_selected"];

    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    vc4.tabBarItem.badgeValue = @"99+";
    vc4.title = @"Profile";
    vc4.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_profile",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile"];
    vc4.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_profile_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile_selected"];

    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];

    LCTabBarController *tabBarC    = [[LCTabBarController alloc] init];
    //    tabBarC.itemTitleFont          = [UIFont boldSystemFontOfSize:11.0f];
    //    tabBarC.itemTitleColor         = [UIColor greenColor];
    //    tabBarC.selectedItemTitleColor = [UIColor redColor];
    //    tabBarC.itemImageRatio         = 0.5f;
    //    tabBarC.badgeTitleFont         = [UIFont boldSystemFontOfSize:12.0f];
    tabBarC.viewControllers        = @[navC1, navC2, navC3, navC4];
    self.window.rootViewController = tabBarC;
    */
//////////////////////////////////////////////////////////////////////////////
    
    // 3, use rootnavcontroller
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    RTRootNavigationController *navigationController = [[RTRootNavigationController alloc] initWithRootViewController:[[AppRootViewController alloc] init]];
    self.AppDelegateViewController = navigationController;
    self.window.rootViewController = self.AppDelegateViewController;
    [self.window makeKeyAndVisible];
     
//////////////////////////////////////////////////////////////////////////////
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"language(%@)sandbox(%@)", NSStringLocalizedInfoPlist(@"LanguageTest"), paths[0]);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
