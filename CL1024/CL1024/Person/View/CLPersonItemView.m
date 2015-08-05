//
//  CLPersonItemView.m
//  CL1024
//
//  Created by LiHongli on 15/8/5.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLPersonItemView.h"

@interface CLPersonItemView()

@end

@implementation CLPersonItemView

- (void)createUI{
    [self setBackgroundImage:[UIImage imageNamed:@"login_bt_bg"] forState:UIControlStateNormal];
    
    [self addSubview:self.icon];
    [self addSubview:self.kTitleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.icon.frame = CGRectMake(41/2, 28/2, 50, 50);
    self.kTitleLabel.frame = CGRectMake(100/2, 140/2, 70/2, 36/2);
}

#pragma mark -- Create View

- (UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UILabel *)kTitleLabel{
    if (!_kTitleLabel) {
        _kTitleLabel = [[UILabel alloc] init];
        _kTitleLabel.textColor = UIColorFromRGB(0xcce2df);
        _kTitleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _kTitleLabel;
}

@end
