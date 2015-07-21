//
//  CLSettingModel.m
//  CL1024
//
//  Created by LiHongli on 15/7/19.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLSettingModel.h"

@implementation CLSettingModel

+ (CLSettingModel *)createSettingModelWithImage:(NSString *)image title:(NSString *)title{
    CLSettingModel *settingModel = [[CLSettingModel alloc] init];
    settingModel.title = title;
    settingModel.image = image;
    return settingModel;
}


@end
