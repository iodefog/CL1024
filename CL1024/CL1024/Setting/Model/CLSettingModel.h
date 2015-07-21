//
//  CLSettingModel.h
//  CL1024
//
//  Created by LiHongli on 15/7/19.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLSettingModel : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *title;

+ (CLSettingModel *)createSettingModelWithImage:(NSString *)image title:(NSString *)title;

@end
