//
//  AdvertiseViewController.m
//  JinSeShiJi
//
//  Created by zn on 16/8/10.
//
//

#import "AdvertiseViewController.h"

@interface AdvertiseViewController ()

//@property (nonatomic, strong) UIWebView *webView; //2020.4 begin, app cannot use UIWebView, must use WKWebView
@property (nonatomic, strong) WKWebView *wwebView; //2020.4 begin, app cannot use UIWebView, must use WKWebView

@end

@implementation AdvertiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广告";
//    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    _webView.backgroundColor = [UIColor whiteColor];
//    if (!self.adUrl || [self.adUrl isEqualToString:@""]) {
//        self.adUrl = @"http://www.baidu.com";
//    }
//    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adUrl]];
//    [_webView loadRequest:request];
//    [self.view addSubview:_webView];
    _wwebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    _wwebView.backgroundColor = [UIColor whiteColor];
    if (!self.adUrl || [self.adUrl isEqualToString:@""]) {
        self.adUrl = @"https://www.baidu.com";
    }
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adUrl]];
    [_wwebView loadRequest:request];
    [self.view addSubview:_wwebView];
}

- (void)setAdUrl:(NSString *)adUrl
{
    _adUrl = adUrl;
}



@end
