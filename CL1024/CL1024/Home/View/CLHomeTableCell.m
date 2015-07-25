//
//  CLHomeTableCell.m
//  CL1024
//
//  Created by LiHongli on 15/7/23.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLHomeTableCell.h"

@implementation CLHomeTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}


- (void)createUI{
    [self addSubview:self.bgContentView];
    [self.bgContentView addSubview:self.iconImageView];
    [self.bgContentView addSubview:self.subIconLable];
    [self.bgContentView addSubview:self.titleLabel];
    [self.bgContentView addSubview:self.detailLabel];
    [self.bgContentView addSubview:self.subDetailButton];
}


- (void)setObject:(CLHomeModel *)item{
    self.homeModel = item;
    self.iconImageView.image = [UIImage imageNamed:item.iconImage];
    self.subIconLable.text = item.subIconText;
    self.titleLabel.text = item.titleText;
    self.detailLabel.text = item.detailText;
    [self.subDetailButton setTitle:item.subDetailText forState:UIControlStateNormal];
    if (item.needSubIcon) {
        self.subIconLable.hidden = NO;
        self.subDetailButton.hidden = NO;
    }else {
        self.subIconLable.hidden = YES;
        self.subDetailButton.hidden = YES;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.bgContentView.frame = CGRectMake(10, 0, self.width - 20, self.homeModel.needSubIcon?103: 154/2+4);
    self.iconImageView.frame = CGRectMake(2, 2, 154/2, 154/2);
    self.subIconLable.frame = CGRectMake(self.iconImageView.left, self.iconImageView.bottom+2, self.iconImageView.width, 44/2);
    self.titleLabel.frame = CGRectMake(self.iconImageView.right+10, 24/2, self.bgContentView.width - self.iconImageView.right - 20, 16);
    self.detailLabel.frame =CGRectMake(self.titleLabel.left, self.titleLabel.bottom+14, self.titleLabel.width, 14);
    [self.detailLabel sizeToFit];
    self.subDetailButton.frame = CGRectMake(self.titleLabel.left, self.subIconLable.top, self.titleLabel.width, self.subIconLable.height);
}

#pragma mark - 

- (UIView *)bgContentView{
    if(!_bgContentView){
        _bgContentView = [[UIView alloc] initWithFrame:CGRectZero];
        _bgContentView.backgroundColor = [UIColor whiteColor];
    }
    return _bgContentView;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.backgroundColor = UIColorFromRGB(0xb1d3df);
    }
    return _iconImageView;
}

- (UILabel *)subIconLable{
    if (!_subIconLable) {
        _subIconLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _subIconLable.textColor = [UIColor whiteColor];
        _subIconLable.backgroundColor = UIColorFromRGB(0xb1d3df);
        _subIconLable.font = [UIFont systemFontOfSize:14];
        _subIconLable.textAlignment = NSTextAlignmentCenter;
    }
    return _subIconLable;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textColor = UIColorFromRGB(0x405f62);
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _detailLabel.textColor = UIColorFromRGB(0xafafaf);
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = [UIFont systemFontOfSize:14];
    }
    return _detailLabel;
}

- (UIButton *)subDetailButton{
    if (!_subDetailButton) {
        _subDetailButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subDetailButton setTitleColor:UIColorFromRGB(0x405f62) forState:UIControlStateNormal];
        _subDetailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _subDetailButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _subDetailButton;
}

@end
