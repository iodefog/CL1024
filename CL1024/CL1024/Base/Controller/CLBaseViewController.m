//
//  CLBaseViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLBaseViewController.h"
#import "AppDelegate.h"

@interface CLBaseViewController ()

@end

@implementation CLBaseViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"nav_bg_ios6"]];
}


- (void)layoutSubViews{

}



#pragma mark - Custom Method
- (void)clickedPerson:(UIBarButtonItem *)barItem{
    AppDelegate * appDelegate =  [UIApplication sharedApplication].delegate;
    if (appDelegate.IIVDC.slideControllerState == SKSlideControllerStateRevealedNone) {
        [appDelegate.IIVDC revealRightContainerViewAnimated:YES];
    }else {
        [appDelegate.IIVDC showMainContainerViewAnimated:YES];
    }
}

- (void)clickedSetting:(UIBarButtonItem *)barItem{
    AppDelegate * appDelegate =  [UIApplication sharedApplication].delegate;
    if (appDelegate.IIVDC.slideControllerState == SKSlideControllerStateRevealedNone) {
        [appDelegate.IIVDC revealLeftContainerViewAnimated:YES];
    }else {
        [appDelegate.IIVDC showMainContainerViewAnimated:YES];
    }
}

#pragma mark - Self create

- (UIBarButtonItem *)createButtonWithImage:(NSString *)image SEL:(SEL)sel{
    
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    itemButton.showsTouchWhenHighlighted = YES;
    itemButton.frame = CGRectMake(0, 0, 60, 44);
    [itemButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    return barItem;
}


@end
