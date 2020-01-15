//
//  ViewController.m
//  DemoProject
//
//  Created by foolsparadise on 24/10/2017.
//  Copyright © 2017 github.com/foolsparadise All rights reserved.
//

#import "ViewController.h"
#import "AppRootViewController.h"
@interface ViewController ()

@end

@implementation ViewController

//- (void)dealloc {
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    itNSLog(@"ViewController.m viewDidLoad");
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"backto" style:UIBarButtonItemStylePlain target:self action:@selector(backtoAppRootViewController)];
    
}
- (void)backtoAppRootViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
