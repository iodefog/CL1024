//
//  CLBottomView.m
//  CL1024
//
//  Created by LiHongli on 15/7/30.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLBottomView.h"

@interface CLBottomView()

@property (nonatomic, strong) UIButton *selectFieldButton;
@property (nonatomic, strong) UIButton *seeCacheButton;
@property (nonatomic, strong) UIButton *reloadFirstButton;
@property (nonatomic, strong) UIButton *prePageButton;
@property (nonatomic, strong) UITextField *selectPageField;
@property (nonatomic, strong) UIButton *behindPageButton;

@end;

@implementation CLBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = UIColorFromRGB(0xf9faec);
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    UIView *sperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 2)];
    sperateLine.backgroundColor = UIColorFromRGB(0x16656c);
    [self addSubview:sperateLine];
    
    [self addSubview:self.selectFieldButton];
    [self addSubview:self.seeCacheButton];
    [self addSubview:self.reloadFirstButton];
    [self addSubview:self.prePageButton];
    [self addSubview:self.selectPageField];
    [self addSubview:self.behindPageButton];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width/7;
    self.selectFieldButton.left = 10;
    self.seeCacheButton.left = 10+width;
    self.reloadFirstButton.left = 10+ 2*width;
    self.prePageButton.left = 20+3*width;
    self.prePageButton.width = 20;
    self.selectPageField.left = 10+4*width;
    self.behindPageButton.left = 20+6*width;
    self.behindPageButton.width = 20;
}

- (UIButton *)selectFieldButton{
    if (!_selectFieldButton) {
        _selectFieldButton = [self createButtonWithImage:@"p_post_filter"];
    }
    return _selectFieldButton;
}

- (UIButton *)seeCacheButton{
    if (!_seeCacheButton) {
        _seeCacheButton = [self createButtonWithImage:@"p_post_switch"];
    }
    return _seeCacheButton;
}

- (UIButton *)reloadFirstButton{
    if (!_reloadFirstButton) {
        _reloadFirstButton = [self createButtonWithImage:@"p_refresh"];
    }
    return _reloadFirstButton;
}

- (UIButton *)prePageButton{
    if (!_prePageButton) {
        _prePageButton = [self createButtonWithImage:@"p_left_black_arrows"];
    }
    return _prePageButton;
}

- (UIButton *)behindPageButton{
    if (!_behindPageButton) {
        _behindPageButton = [self createButtonWithImage:@"p_right_black_arrows"];;
    }
    return _behindPageButton;
}

- (UITextField *)selectPageField{
    if (!_selectPageField) {
        _selectPageField = [[UITextField alloc] initWithFrame:CGRectMake(0, 8, 90, 30)];
        _selectPageField.backgroundColor = [UIColor whiteColor];
        _selectPageField.enabled = NO;
        _selectPageField.textColor = UIColorFromRGB(0xafafaf);
        _selectPageField.layer.borderColor = UIColorFromRGB(0xafafaf).CGColor;
        _selectPageField.layer.cornerRadius = 3;
        _selectPageField.layer.borderWidth = 1.f;
        _selectPageField.text = @"1/100";
        _selectPageField.textAlignment = NSTextAlignmentCenter;
    }
    return _selectPageField;
}


- (UIButton *)createButtonWithImage:(NSString *)image{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 45, 45);
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    return button;
}


@end
