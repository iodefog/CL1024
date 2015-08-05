//
//  CLPersonItemView.h
//  CL1024
//
//  Created by LiHongli on 15/8/5.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPersonItemView : UIButton

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel     *kTitleLabel;

- (void)createUI;

@end
