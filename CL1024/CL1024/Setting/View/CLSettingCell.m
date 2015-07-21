//
//  CLSettingCell.m
//  CL1024
//
//  Created by LiHongli on 15/7/19.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLSettingCell.h"

@implementation CLSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLable];
    [self addSubview:self.rightImageView];

}

- (void)setObject:(CLSettingModel *)item{
    
    self.titleLable.text = item.title;
    self.iconImageView.image = [UIImage imageNamed:item.image];
}




- (void)layoutSubviews{
    [super layoutSubviews];

    self.iconImageView.frame = CGRectMake(15, 5, 24, 24);
    self.rightImageView.frame = CGRectMake(self.width - 70, 10, 15, 15);
    self.titleLable.frame = CGRectMake(self.iconImageView.right+10, 0, self.width-self.iconImageView.right-10-self.rightImageView.width-20, self.height);
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 

- (UILabel *)titleLable{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLable.font = [UIFont systemFontOfSize:15.0f];
        _titleLable.textColor = [UIColor whiteColor];
    }
    return _titleLable;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _iconImageView;
}

- (UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImageView.image = [UIImage imageNamed:@"setting_right_arrows"];
    }
    return _rightImageView;
}

@end
