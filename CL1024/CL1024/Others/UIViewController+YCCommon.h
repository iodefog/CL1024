//
//  UIViewController+YCCommon.h
//  LiHongli
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

#define kNetWorkErrorTip  @"网络不给力,请稍后重试"

@interface UIViewController (YCCommon)

@property (nonatomic,strong) UIImageView * homeShotImageV;


- (void)showProgressHUD;

- (void)hideProgressHUD;

- (void)showToastMessage:(NSString *)message;

- (void)showBackButton;

- (void)showBackButtonWithImage:(NSString *)imagestr;

- (void)showBackButtonWithTitle:(NSString *)title;

- (void)hideBackButton;

- (void)showDownButton;

- (void)backBarButtonPressed:(id)sender;

- (void)showRightButtonWithTitle:(NSString *)title;

- (void)hideRightButton;

- (void)showRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)color;

- (void)showRightButtonWithImage:(UIImage *)image andHigImage:(UIImage *)higImage;

- (void)showRightButtonWithImage:(UIImage *)image andImage:(UIImage *)anotherImage;

- (void)showRightButtonWithBackgroundImage:(UIImage *)image andTitle:(NSString *)title;

- (UIButton *)getRightButtonFromRightBarButtonItem;

- (UIButton *)getBackButtonFromRightBarButtonItem;

-(void)showrightButtonWithStatus:(BOOL)isShow;

- (void)changeRightBarButtonItemTextColor:(UIColor *)color;


- (void)rightBarButtonPressed:(id)sender;

- (void)showNetWorkFailToast;

- (void)autoLayoutIOS6OrIOS7NavigationBar;

//- (void)umengBeginEventClick:(NSString *)eventId;
//
//- (void)umengEndEventClick:(NSString *)eventId;

- (void)showOffLineImage:(NSString *)imageName andLabelText:(NSString *)labelText andPoint:(CGPoint)point;

//屏幕截图
- (UIImage *)getSnapshotImage;
-(UIImage *)getSnapshotImageByView:(UIView *)customView;

-(UIViewController *)getSpecificClassWithName:(NSString *)className;

#pragma mark -- tableview 相关
-(UITableViewCell *)getCellWithTableView:(UITableView *)tableView cellID:(NSString *)cellID nibName:(NSString *)nibName;


-(void)registerTableView:(UITableView *)tableView withCellNibName:(NSString *)nibName cellIdentifier:(NSString *)cellIdentifier;

- (void)showPreViewImageView:(NSString *)imageUrl;

- (void)hiddenPreViewImageView;


@end








