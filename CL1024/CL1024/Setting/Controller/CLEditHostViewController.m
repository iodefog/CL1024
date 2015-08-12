//
//  CLEditHostViewController.m
//  CL1024
//
//  Created by LiHongli on 15/8/10.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLEditHostViewController.h"

@interface CLEditHostViewController ()

@property (nonatomic, strong) UITextField *urlTextFiled;

@end

@implementation CLEditHostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.urlTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, self.view.width-40, 44)];
    self.urlTextFiled.borderStyle = UITextBorderStyleLine;
    self.urlTextFiled.placeholder = @"正在使用内置地址";
    self.urlTextFiled.userInteractionEnabled = NO;
    if (![DefaultValueForKey(kDefaultUrlKey) isEqualToString:kDefalutHost]) {
        self.urlTextFiled.text = DefaultValueForKey(kDefaultUrlKey);
    }
    self.urlTextFiled.textColor = [UIColor blackColor];
    [self.view addSubview:self.urlTextFiled];
    
    UIButton *defaultAddress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    defaultAddress.frame = CGRectMake(20, 64+20, 80, 40);
    [defaultAddress addTarget:self action:@selector(saveDefaultHost:) forControlEvents:UIControlEventTouchUpInside];
    [defaultAddress setTitle:@"内置地址" forState:UIControlStateNormal];
    [defaultAddress setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:defaultAddress];
 
    UIButton *userAddress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    userAddress.frame = CGRectMake(20, 64+20+60, 80, 40);
    [userAddress addTarget:self action:@selector(saveCustomHost:) forControlEvents:UIControlEventTouchUpInside];
    [userAddress setTitle:@"自定义地址" forState:UIControlStateNormal];
    [userAddress setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:userAddress];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked:)];
}

- (void)rightClicked:(UIBarButtonItem *)barItem{
    if ([self.urlTextFiled.text hasPrefix:@"http"]) {
        kSetDefaultHost(self.urlTextFiled.text);
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self showToastMessage:@"输入的URL有错"];
    }
}

- (void)saveDefaultHost:(UIButton *)sender{
    kSetDefaultHost(kDefalutHost);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveCustomHost:(UIButton *)sender{
    self.urlTextFiled.placeholder = @"请输入地址";
    self.urlTextFiled.userInteractionEnabled = YES;
    [self.urlTextFiled resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
