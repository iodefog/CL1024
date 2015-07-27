//
//  CLFieldViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/27.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldViewController.h"

@interface CLFieldViewController ()

@end

@implementation CLFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    [self.view addSubview:webView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
