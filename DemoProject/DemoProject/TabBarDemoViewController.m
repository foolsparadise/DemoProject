//
//  TabBarDemoViewController.m
//  DemoProject
//
//  Created by foolsparadise on 4/11/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "TabBarDemoViewController.h"
#import "AppRootViewController.h"
@interface TabBarDemoViewController ()

@end

@implementation TabBarDemoViewController

//- (void)dealloc {
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    itNSLog(@"TabBarDemoViewController viewDidLoad");
    self.view.backgroundColor = [UIColor redColor];
    // 设置navigationItem左右item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change Item" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClicked)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Goto 2nd" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClicked)];
    
}
- (void)leftBarButtonItemClicked {
    // 重新设置tabBarItem
    self.tabBarItem.badgeValue = @"99";
    self.tabBarItem.image = ImageWithNameInBundleFile(@"tabbar_profile",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile"];
    self.tabBarItem.selectedImage = ImageWithNameInBundleFile(@"tabbar_profile_selected",@"LCTabBarControllerMore");//[UIImage imageNamed:@"tabbar_profile_selected"];
    self.tabBarItem.title = @"Woo!";
    //    for (UIViewController *vc in ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers) {
    //        itNSLog(@"%@", vc);
    //        vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", vc.tabBarItem.badgeValue.integerValue + 100];
    //    }
    // 计算加减
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[0].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[0].tabBarItem.badgeValue.integerValue + 1];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[1].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[1].tabBarItem.badgeValue.integerValue + 10];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[2].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[2].tabBarItem.badgeValue.integerValue + 100];
    ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[3].tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", ((UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController).viewControllers[3].tabBarItem.badgeValue.integerValue + 1000];
    // Key code
    // System will display the original controls so you should call this line when you change any tabBar item
    [(LCTabBarController *)self.tabBarController removeOriginControls];
}

- (void)rightBarButtonItemClicked {
    // 跳转到第2个
    [(LCTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController setSelectedIndex:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
