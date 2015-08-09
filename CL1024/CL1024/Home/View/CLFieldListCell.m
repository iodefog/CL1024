//
//  CLFieldListCell.m
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListCell.h"
#import "RTLabel.h"

@interface CLFieldListCell()<RTLabelDelegate>

@property (nonatomic, strong) RTLabel       *titleLabel;
@property (nonatomic, strong) UILabel       *authorLabel;
@property (nonatomic, strong) UILabel       *timeLabel;
@property (nonatomic, strong) UILabel       *commentCountLabel;
@property (nonatomic, strong) UILabel       *haveReadLabel;
@property (nonatomic, strong) UIImageView   *commentIcon;

@end


@implementation CLFieldListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}


- (void)createUI{
    [self addSubview:self.titleLabel];
    [self addSubview:self.haveReadLabel];
    [self addSubview:self.authorLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.commentIcon];
    [self addSubview:self.commentCountLabel];
}


- (void)setObject:(CLFieldListModel *)item{
    self.titleLabel.text = item.title;
    self.authorLabel.text = item.author;
    self.timeLabel.text = item.time;
    self.commentCountLabel.text = item.commentCount;
    self.haveReadLabel.hidden = YES;
}



- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(10, 7, self.width - 60, 50);
    self.titleLabel.height = self.titleLabel.optimumSize.height;
    self.haveReadLabel.frame = CGRectMake(self.width-40, self.titleLabel.top, 30, 16);
    self.authorLabel.frame =CGRectMake(10,self.titleLabel.bottom+10, 200, 20);
    self.timeLabel.frame = CGRectMake(300/2, self.authorLabel.top, 160/2, self.authorLabel.height);
    self.commentIcon.frame = CGRectMake(self.timeLabel.right+20, self.timeLabel.top, 40/2, 40/2);
    self.commentCountLabel.frame = CGRectMake(self.commentIcon.left+self.commentIcon.width+5, self.timeLabel.top, 60, self.timeLabel.height);
}

- (RTLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.userInteractionEnabled = NO;
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)authorLabel{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _authorLabel.font = [UIFont systemFontOfSize:14];
        _authorLabel.textColor = UIColorFromRGB(0xafafaf);
    }
    return _authorLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = UIColorFromRGB(0xafafaf);
    }
    return _timeLabel;
}

- (UILabel *)commentCountLabel{
    if (!_commentCountLabel) {
        _commentCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _commentCountLabel.font = [UIFont systemFontOfSize:14];
        _commentCountLabel.textColor = UIColorFromRGB(0xafafaf);
    }
    return _commentCountLabel;
}

- (UILabel *)haveReadLabel{
    if (!_haveReadLabel) {
        _haveReadLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _haveReadLabel.font = [UIFont systemFontOfSize:14];
        _haveReadLabel.textColor = [UIColor grayColor];
        _haveReadLabel.text = @"已读";
        _haveReadLabel.backgroundColor = [UIColor orangeColor];
        _haveReadLabel.hidden = YES;
    }
    return _haveReadLabel;
}

- (UIImageView *)commentIcon{
    if (!_commentIcon) {
        _commentIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        _commentIcon.image = [UIImage imageNamed:@"reply_num_icon"];
    }
    return _commentIcon;
}

@end
