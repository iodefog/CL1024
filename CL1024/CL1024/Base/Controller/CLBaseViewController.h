//
//  CLBaseViewController.h
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface CLBaseViewController : UIViewController

- (void)clickedPerson:(UIBarButtonItem *)barItem;
- (void)clickedSetting:(UIBarButtonItem *)barItem;
- (UIBarButtonItem *)createButtonWithImage:(NSString *)image SEL:(SEL)sel left:(BOOL)left;
- (void)layoutSubViews;

@end
