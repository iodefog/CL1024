//
//  CLHomeViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLHomeViewController.h"

@implementation CLHomeViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title  = @"草榴社区";
    
    self.navigationItem.leftBarButtonItem = [self createButtonWithImage:@"icon_main_setting" SEL:@selector(clickedSetting:)];

    self.navigationItem.rightBarButtonItem = [self createButtonWithImage:@"icon_main_person" SEL:@selector(clickedPerson:)];

}

#pragma mark - Custom Method
- (void)clickedPerson:(UIBarButtonItem *)barItem{

}

- (void)clickedSetting:(UIBarButtonItem *)barItem{
    
}

#pragma mark - Self create

- (UIBarButtonItem *)createButtonWithImage:(NSString *)image SEL:(SEL)sel{
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:image] style:UIBarButtonItemStylePlain target:self action:sel];
    return barItem;
}

@end
