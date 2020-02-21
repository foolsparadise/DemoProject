//
//  TabBarDemo2ViewController.m
//  DemoProject
//
//  Created by foolsparadise on 21/2/2020.
//  Copyright © 2020 github.com/foolsparadise All rights reserved.
//

#import "TabBarDemo2ViewController.h"

@interface TabBarDemo2ViewController () <UISearchBarDelegate>

@property (nonatomic, weak) UIButton *leftButton;
@property (nonatomic, weak) UISearchBar *searchBar;
@property (nonatomic, weak) UIButton *rightButton;

@end

@implementation TabBarDemo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"TabBarDemo2ViewController";
    [self initCurrentNavigationItem];
    
}
- (void)initCurrentNavigationItem
{
    //搜索
    UIView *titleView = [[UIView alloc] init];
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];
    [titleView addSubview:searchBar];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) { // iOS 11
        [NSLayoutConstraint activateConstraints:@[
                                                  [searchBar.topAnchor constraintEqualToAnchor:titleView.topAnchor],
                                                  [searchBar.leftAnchor constraintEqualToAnchor:titleView.leftAnchor],
                                                  [searchBar.rightAnchor constraintEqualToAnchor:titleView.rightAnchor],
                                                  [searchBar.bottomAnchor constraintEqualToAnchor:titleView.bottomAnchor]
                                                  ]];
    } else {
        searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    self.navigationItem.titleView = titleView;
    searchBar.placeholder = [NSBundle py_localizedStringForKey:@"PYSearchSearchPlaceholderText"];
    searchBar.backgroundImage = [NSBundle py_imageNamed:@"clearImage"];
    searchBar.delegate = self;
    for (UIView *subView in [[searchBar.subviews lastObject] subviews]) {
        if ([[subView class] isSubclassOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)subView;
            textField.font = [UIFont systemFontOfSize:16];
            //_searchTextField = textField;
            break;
        }
    }
    self.searchBar = searchBar;
    self.navigationItem.titleView = self.searchBar;
    //返回
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *backImage = [NSBundle py_imageNamed:@"back"];
    backButton.titleLabel.font = [UIFont systemFontOfSize:17];
    //[backButton setTitle:[NSBundle py_localizedStringForKey:@"Back"] forState:UIControlStateNormal];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backDidClick)  forControlEvents:UIControlEventTouchUpInside];
    backButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton.imageView sizeToFit];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -ceil(backImage.size.width / 2.0), 0, 0);
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [backButton sizeToFit];
    //backButton.py_width += 3;
    self.leftButton = backButton;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //取消
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [cancleButton setTitle:[NSBundle py_localizedStringForKey:@"Cancel"] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancelDidClick)  forControlEvents:UIControlEventTouchUpInside];
    cancleButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    cancleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [cancleButton sizeToFit];
    //cancleButton.py_width += PYSEARCH_MARGIN;
    self.rightButton = cancleButton;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancleButton];
    
    self.navigationItem.titleView.backgroundColor = [UIColor yellowColor];
}

/*
 - (UIViewController *)get1SearchVC
 {
        // 1. Create an Array of popular search
         NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
         // 2. Create a search view controller
         PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:NSLocalizedString(@"PYExampleSearchPlaceholderText", @"搜索编程语言") didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
             // Called when search begain.
             // eg：Push to a temp view controller
             NSLog(@"%@", searchText);
         }];
         // 3. Set style for popular search and search history
         //searchViewController.hotSearchStyle = 0;
         //searchViewController.searchHistoryStyle = PYHotSearchStyleDefault;
         searchViewController.hotSearchStyle = PYHotSearchStyleDefault;
         searchViewController.searchHistoryStyle = 0;
         
         // 4. Set delegate
         searchViewController.delegate = self;
         // 5. Present(Modal) or push search view controller
         // Present(Modal)
     //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
     //    [self presentViewController:nav animated:YES completion:nil];
         // Push
         // Set mode of show search view controller, default is `PYSearchViewControllerShowModeModal`
         searchViewController.searchViewControllerShowMode = PYSearchViewControllerShowModePush;
     //    // Push search view controller
     return searchViewController;
 }
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
