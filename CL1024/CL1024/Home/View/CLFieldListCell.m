//
//  CLFieldListCell.m
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListCell.h"
#import "RTLabel.h"
#import "CLFieldListModel.h"

@interface CLFieldListCell()

@property (nonatomic, strong) RTLabel       *titleLabel;
@property (nonatomic, strong) RTLabel       *authorLabel;
@property (nonatomic, strong) RTLabel       *timeLabel;
@property (nonatomic, strong) RTLabel       *commentCountLabel;
@property (nonatomic, strong) RTLabel       *haveReadLabel;
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
    self.haveReadLabel.hidden = NO;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(10, 7, self.width - 60, 50);
    self.titleLabel.height = self.titleLabel.optimumSize.height;
    self.haveReadLabel.frame = CGRectMake(self.width-40, self.titleLabel.top, 30, 16);
    self.authorLabel.frame =CGRectMake(10, 53, 200, 15);
    self.timeLabel.frame = CGRectMake(340/2, self.authorLabel.top, 130/2, self.authorLabel.height);
    self.commentIcon.frame = CGRectMake(self.timeLabel.right+40, self.timeLabel.top, 30/2, 30/2);
    self.commentCountLabel.frame = CGRectMake(self.commentIcon.left+self.commentIcon.width+5, self.timeLabel.top, 60, self.timeLabel.height);
}

- (RTLabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (RTLabel *)authorLabel{
    if (!_authorLabel) {
        _authorLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _authorLabel.font = [UIFont systemFontOfSize:10];
    }
    return _authorLabel;
}

- (RTLabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _timeLabel.font = [UIFont systemFontOfSize:10];
    }
    return _timeLabel;
}

- (RTLabel *)commentCountLabel{
    if (!_commentCountLabel) {
        _commentCountLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _commentCountLabel.font = [UIFont systemFontOfSize:10];
    }
    return _commentCountLabel;
}

- (RTLabel *)haveReadLabel{
    if (!_haveReadLabel) {
        _haveReadLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
        _haveReadLabel.font = [UIFont systemFontOfSize:15];
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
