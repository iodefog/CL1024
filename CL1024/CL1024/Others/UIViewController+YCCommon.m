//
//  UIViewController+YCCommon.m
//  LiHongli
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "UIViewController+YCCommon.h"
#import "YCProgressHUD.h"

@implementation UIViewController (YCCommon)
@dynamic homeShotImageV;

- (void)showProgressHUD
{
    [self hideProgressHUD];
    [YCProgressHUD showHUDAddedTo:self.view];
}
- (void)hideProgressHUD
{
    [YCProgressHUD hideHUDForView:self.view];
}

- (void)showToastMessage:(NSString *)message
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithFrame:self.view.bounds];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.labelFont = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:1.5];
}

- (void)showBackButton
{
    UIImage *image = [UIImage imageNamed:@"back"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,44, 44)];
    [button setImage:image forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(backBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;
}


- (void)showBackButtonWithImage:(NSString *)imagestr
{
    UIImage *image = [UIImage imageNamed:imagestr];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setImage:image forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(backBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)showBackButtonWithTitle:(NSString *)title
{
    UIButton *button = [self createButtonWithTitle:title];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(backBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)hideBackButton
{
    UIButton *button = [self createButtonWithTitle:@""];
    button.enabled = NO;
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(backBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;
}


- (void)showDownButton{
    UIImage *image = [UIImage imageNamed:@"back"];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  image.size.width,
                                                                  image.size.height)];
    [button setImage:image forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(downButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = barItem;

}

- (void)downButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)backBarButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showRightButtonWithTitle:(NSString *)title
{
    UIButton *button = [self createButtonWithTitle:title];
    [button setTitleColor:RGB(236, 73, 73) forState:UIControlStateNormal];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}
- (void)hideRightButton
{
    UIButton *button = [self createButtonWithTitle:@""];
    button.enabled = NO;
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}
- (void)showRightButtonWithTitle:(NSString *)title titleColor:(UIColor *)color
{
    UIButton *button = [self createButtonWithTitle:title titleColor:color];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)showRightButtonWithImage:(UIImage *)image andHigImage:(UIImage *)higImage
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 44-image.size.width, 0, 0);
    [button setImage:image forState:UIControlStateNormal];
    if (!higImage) {
        [button setImage:image forState:UIControlStateHighlighted];
    }
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (void)showRightButtonWithImage:(UIImage *)image andImage:(UIImage *)anotherImage
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(rightFirstBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem1 = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *anotherButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, anotherImage.size.width, anotherImage.size.height)];
    [anotherButton setImage:anotherImage forState:UIControlStateNormal];
    [anotherButton setImage:anotherImage forState:UIControlStateHighlighted];
    [anotherButton addTarget:self action:@selector(rightBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem2 = [[UIBarButtonItem alloc] initWithCustomView:anotherButton];

    self.navigationItem.rightBarButtonItems = @[barItem2,barItem1];
}

- (void)rightFirstBarButtonPressed:(UIButton *)sender{
    
}

- (void)showRightButtonWithBackgroundImage:(UIImage *)image andTitle:(NSString *)title
{
    UIButton *button = [self createButtonWithTitle:title];
    CGRect frame = button.frame;
    frame.size.width += 25;
    button.frame = frame;
    image = [image stretchableImageWithLeftCapWidth:2 topCapHeight:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [button addTarget:self
               action:@selector(rightBarButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = barItem;
}

- (UIButton *)getRightButtonFromRightBarButtonItem{
    UIButton *rightButton = (id)self.navigationItem.rightBarButtonItem.customView;
    if ([rightButton isKindOfClass:[UIButton class]]) {
        return rightButton;
    }
    return nil;
}

- (UIButton *)getBackButtonFromRightBarButtonItem{
    UIButton *backButton = (id)self.navigationItem.leftBarButtonItem.customView;
    if ([backButton isKindOfClass:[UIButton class]]) {
        return backButton;
    }
    return nil;
}

-(void)showrightButtonWithStatus:(BOOL)isShow
{
    UIButton *btn = self.navigationController.navigationBar.subviews[2];
    btn.hidden= !isShow;
}


- (void)changeRightBarButtonItemTextColor:(UIColor *)color{
    UIButton *rightButton = [self getRightButtonFromRightBarButtonItem];
    [rightButton setTitleColor:color forState:UIControlStateNormal];
}


- (void)rightBarButtonPressed:(id)sender 
{
    
}

- (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color
{
    UIButton *btn =[self createButtonWithTitle:title];
    [btn setTitleColor:color forState:UIControlStateNormal];
    return btn;
}


- (UIButton *)createButtonWithTitle:(NSString *)title
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    CGSize size = [self sizeWithTitle:title font:button.titleLabel.font boundSize:button.frame.size lineBreakMode:NSLineBreakByWordWrapping];
    button.frame = CGRectMake(0, 0, size.width, 44);
    return button;
}

- (CGSize)sizeWithTitle:(NSString *)title font:(UIFont *)font boundSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{ NSFontAttributeName : font,
                                  NSParagraphStyleAttributeName : paragraphStyle.copy };
    
    CGSize contentSize = [title boundingRectWithSize:size
                                            options:(NSStringDrawingTruncatesLastVisibleLine |
                                                     NSStringDrawingUsesLineFragmentOrigin |
                                                     NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil].size;
    return contentSize;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)showNetWorkFailToast {
    [self showToastMessage:kNetWorkErrorTip];
}

- (void)autoLayoutIOS6OrIOS7NavigationBar
{
    //适配ios6和ios7导航透明
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

//- (void)umengBeginEventClick:(NSString *)eventId {
//    [MobClick beginLogPageView:eventId];
//}
//
//- (void)umengEndEventClick:(NSString *)eventId {
//    [MobClick endLogPageView:eventId];
//}

- (void)showOffLineImage:(NSString *)imageName andLabelText:(NSString *)labelText andPoint:(CGPoint)point {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(point.x, point.y, image.size.width, image.size.height)];
    imageView.image = image;
    [self.view addSubview:imageView];
    UILabel *offLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(point.x-40, point.y+120, 200, 30)];
    offLineLabel.text = labelText;
    offLineLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:offLineLabel];
}

-(UITableViewCell *)getCellWithTableView:(UITableView *)tableView cellID:(NSString *)cellID nibName:(NSString *)nibName
{
    UITableViewCell * customCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (customCell == nil) {
        NSArray * topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            customCell = (UITableViewCell *)currentObject;
            break;
        }
    }
    return customCell;
}

-(void)registerTableView:(UITableView *)tableView withCellNibName:(NSString *)nibName cellIdentifier:(NSString *)cellIdentifier
{
    UINib *nib=[UINib nibWithNibName:nibName bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    
}



- (UIImage *)getSnapshotImage {
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0.0);
    [self.navigationController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    NSData * data = UIImagePNGRepresentation(image);
//    NSLog(@"skjfkasjdfkasdpath = %@",[NSString stringWithFormat:@"%@/Documents/ssss",NSHomeDirectory()]);
//    [data writeToFile:[NSString stringWithFormat:@"%@/Documents/ssss",NSHomeDirectory()] atomically:NO];
    return image;
}

-(UIImage *)getSnapshotImageByView:(UIView *)customView{
    UIGraphicsBeginImageContextWithOptions(customView.bounds.size, NO, 0.0);
    [customView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


-(UIViewController *)getSpecificClassWithName:(NSString *)className
{
    for (id controller in self.navigationController.viewControllers) {
        if ([[controller class] isKindOfClass:NSClassFromString(className)]) {
            return controller;
        }
    }
    return self.navigationController.viewControllers[0];
}

@end



