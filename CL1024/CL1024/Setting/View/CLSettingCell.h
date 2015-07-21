//
//  CLSettingCell.h
//  CL1024
//
//  Created by LiHongli on 15/7/19.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSettingModel.h"

@interface CLSettingCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

- (void)setObject:(id)item;

@end
