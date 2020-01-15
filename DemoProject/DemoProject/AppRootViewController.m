//
//  AppRootViewController.m
//  DemoProject
//
//  Created by foolsparadise on 24/10/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "AppRootViewController.h"
#import "ViewController.h"
@interface AppRootViewController ()

@end

@implementation AppRootViewController

//- (void)dealloc {
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    itNSLog(@"AppRootViewController.m viewDidLoad");
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"goto" style:UIBarButtonItemStylePlain target:self action:@selector(gotoViewController)];
    
}
- (void)gotoViewController {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
