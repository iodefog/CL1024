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
#import "CLCoreDataManager.h"
@interface CLAPIViewController : CLBaseViewController<UIWebViewDelegate>

@property (nonatomic, strong) NSString          *url;
@property (nonatomic, strong) NSMutableArray    *model;
@property (nonatomic, assign) NSInteger         pageIndex;

- (NSString *)entityName;

- (void)requestMainWithPageIndex:(NSInteger)pageIndex Success:(void(^)(BOOL Success, NSArray *newData))success;

- (void)reloadResponseData;

@end
