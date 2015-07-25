//
//  CLHomeTableCell.h
//  CL1024
//
//  Created by LiHongli on 15/7/23.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLHomeModel.h"

@interface CLHomeTableCell : UITableViewCell

@property (nonatomic, strong) CLHomeModel *homeModel;
@property (nonatomic, strong) UIView      *bgContentView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel     *subIconLable;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *detailLabel;
@property (nonatomic, strong) UIButton    *subDetailButton;

- (void)setObject:(CLHomeModel *)item;

@end
