//
//  CLHomeModel.m
//  CL1024
//
//  Created by LiHongli on 15/7/25.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLHomeModel.h"

@implementation CLHomeModel


- (BOOL)needSubIcon{
    BOOL mm = NO;
    if (self.subIconText) {
        mm  = YES;
    }
    return mm;
}

+ (CLHomeModel *)createModelWithIconImage:(NSString *)iconImage
                              subIconText:(NSString *)subIconText
                                titleText:(NSString *)titleText
                               detailText:(NSString *)detailText
                            subDetailText:(NSString *)subDetailText
                                      url:(NSString *)url{
    CLHomeModel *model = [[CLHomeModel alloc] init];
    model.iconImage = iconImage;
    model.subIconText = subIconText;
    model.titleText = titleText;
    model.detailText = detailText;
    model.subDetailText = subDetailText;
    model.url = url;
    return model;
}


@end
