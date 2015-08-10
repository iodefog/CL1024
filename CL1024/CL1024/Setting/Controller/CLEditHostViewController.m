//
//  CLEditHostViewController.m
//  CL1024
//
//  Created by LiHongli on 15/8/10.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLEditHostViewController.h"

@interface CLEditHostViewController ()

@end

@implementation CLEditHostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *defultAddress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    defultAddress.frame = CGRectMake(20, 64+20, 80, 40);
    [defultAddress setTitle:@"内置地址" forState:UIControlStateNormal];
    [defultAddress setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:defultAddress];
 
    UIButton *userAddress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    userAddress.frame = CGRectMake(20, 64+20+60, 80, 40);
    [userAddress setTitle:@"自定义地址" forState:UIControlStateNormal];
    [userAddress setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:userAddress];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked:)];
}

- (void)rightClicked:(UIBarButtonItem *)barItem{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
