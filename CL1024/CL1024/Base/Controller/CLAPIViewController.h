//
//  CLAPIViewController.h
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLBaseViewController.h"
#import "SKSlideViewController.h"
@interface CLAPIViewController : CLBaseViewController<UIWebViewDelegate>

@property (nonatomic, strong) NSURL             *url;
@property (nonatomic, strong) NSMutableArray    *model;

- (void)requestMain;

- (void)reloadResponseData;

@end
