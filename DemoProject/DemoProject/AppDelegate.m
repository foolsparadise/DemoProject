//
//  AppDelegate.m
//  DemoProject
//
//  Created by foolsparadise on 24/10/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AppDelegate.h"
#import "AppRootViewController.h"
#import "TabBarDemo1ViewController.h"
#import "TabBarDemo2ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self gotoMainView];
    return YES;

}
 
-(void)gotoMainView
{
//////////////////////////////////////////////////////////////////////////////
    //if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0) {
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
    // 方案1, use 1 viewcontroller
    UIViewController *rootVC = .....
    UINavigationController *rootNav  = [[UINavigationController alloc] initWithRootViewController: rootVC];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    self.window.rootViewController = rootNav;
    [self.window addSubview:self.window.rootViewController.view];
    [self.window makeKeyAndVisible];
    */
//////////////////////////////////////////////////////////////////////////////
    
    // 方案2, use 1 tabcontroller

    TabBarDemo1ViewController *vc1 = [[TabBarDemo1ViewController alloc] init];
    vc1.view.backgroundColor = [UIColor whiteColor];
    //vc1.tabBarItem.badgeValue = @"23";
    //vc1.title = @"Home";
    vc1.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_home",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_home"];
    vc1.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_home_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_home_selected"];

    TabBarDemo2ViewController *vc2 = [[TabBarDemo2ViewController alloc] init];
    vc2.view.backgroundColor = [UIColor cyanColor];
    //vc2.tabBarItem.badgeValue = @"1";
    //vc2.title = @"Message";
    vc2.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_message_center",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_message_center"];
    vc2.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_message_center_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_message_center_selected"];

    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor redColor];
    //vc3.title = @"Discover";
    vc3.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_discover",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_discover"];
    vc3.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_discover_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_discover_selected"];

    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    //vc4.tabBarItem.badgeValue = @"99+";
    //vc4.title = @"Profile";
    vc4.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_profile",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile"];
    vc4.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_profile_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile_selected"];

//    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
//    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
//    UINavigationController *navC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
//    UINavigationController *navC4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    RTRootNavigationController *navC1 = [[RTRootNavigationController alloc] initWithRootViewController:vc1];
    navC1.tabBarItem.title = NSStringLocalizedInfoPlist(@"View1");
    RTRootNavigationController *navC2 = [[RTRootNavigationController alloc] initWithRootViewController:vc2];
    navC2.tabBarItem.title = NSStringLocalizedInfoPlist(@"View2");
    RTRootNavigationController *navC3 = [[RTRootNavigationController alloc] initWithRootViewController:vc3];
    navC3.tabBarItem.title = NSStringLocalizedInfoPlist(@"View3");
    RTRootNavigationController *navC4 = [[RTRootNavigationController alloc] initWithRootViewController:vc4];
    navC4.tabBarItem.title = NSStringLocalizedInfoPlist(@"View4");

    LCTabBarController *tabBarC    = [[LCTabBarController alloc] init];
    tabBarC.itemTitleFont          = [UIFont fontWithName:@"NotoSansCJK-Regular" size:11.5]; //设置自定义字体
    tabBarC.itemTitleColor         = [UIColor blackColor];
    tabBarC.selectedItemTitleColor = [UIColor blackColor];
    //    tabBarC.itemImageRatio         = 0.5f;
    //    tabBarC.badgeTitleFont         = [UIFont boldSystemFontOfSize:12.0f];
    tabBarC.viewControllers        = @[navC1, navC2, navC3, navC4];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = tabBarC;
    
//////////////////////////////////////////////////////////////////////////////
    /*
    // 方案3, use rootnavcontroller
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    RTRootNavigationController *navigationController = [[RTRootNavigationController alloc] initWithRootViewController:[[AppRootViewController alloc] init]];
    self.AppDelegateViewController = navigationController;
    self.window.rootViewController = self.AppDelegateViewController;
    [self.window makeKeyAndVisible];
     */
//////////////////////////////////////////////////////////////////////////////
    
    //self.window.backgroundColor = [UIColor whiteColor];
    //设置默认的 DarkMode ?! 适配夜间模式/深色外观(Dark Mode)
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0) {
        if (@available(iOS 13, *))
            self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    } else {
        // Fallback on earlier versions
    }
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    itNSLog(@"language(%@)sandbox(%@)", NSStringLocalizedInfoPlist(@"LanguageTest"), paths[0]);
    [self printFontName]; //打印所有字体,其中有自添加的开源字体 思源黑体NotoSansCJK-Regular 等
    
    // 判断沙盒中是否存在广告图片，如果存在，直接显示
    NSString *filePath = [AdImageTool getFilePathWithImageName:[kUserDefaults valueForKey:adImageName]];
    BOOL isExist = [AdImageTool isFileExistWithFilePath:filePath];
    if (isExist) {// 图片存在
        AdvertiseView *advertiseView = [[AdvertiseView alloc] initWithFrame:self.window.bounds];
        advertiseView.filePath = filePath;
        [advertiseView show];
    }
    
    // 无论沙盒中是否存在广告图片，都需要重新调用广告接口，判断广告是否更新,这一步在首页中完成。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"pushtoad" object:nil];//广告页点击事件
    [AdImageTool getAdvertisingImage];//判断广告是否更新 图片URL地址,在 AdImageTool.m getAdvertisingImage 中修改
    

}

- (void)pushToAd {
    NSLog(@"pushtoAd 建议不要写在AppDelegate写在其它地方");
    //UIWindow *window = [UIApplication sharedApplication].keyWindow;
    LCTabBarController *drawerVC = (LCTabBarController *)((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController;
    //跳转,代码OK的
    //WebViewController *vc = [WebViewController new];
    //[drawerVC.viewControllers[0] pushViewController:vc animated:YES];
}
// 遍历获取字体名称
- (void)printFontName
{
    for(NSString *fontFamilyName in [UIFont familyNames]){
        itNSLog(@"fontfamily:'%@'",fontFamilyName);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]){
            itNSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
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
