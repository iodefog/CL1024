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

- (NSString *)url{
        return [self getRightUrlStrWithSub:NO];
}

- (NSString *)subUrl{
    return [self getRightUrlStrWithSub:YES];
}

- (NSString *)getRightUrlStrWithSub:(BOOL)sub{
    NSInteger fid = 0;
    NSInteger subFid = 0;
    switch (self.modelType) {
        case kTechComment:
            fid = 7;
            break;
        case kNewUs:
            fid = 8;
            break;
        case kOurFlag:
            fid = 16;
            break;
        case kTextQu:
            fid = 20;
            break;
        case kCLZixun:
            fid = 9;
            break;
            
        case kWuMaZhuanQu:
            fid = 2;
            subFid = 17;
            break;
        case kYouMaZhuanQu:
            fid = 15;
            subFid = 18;
            break;
        case kOuMeiZhuanQu:
            fid = 4;
            subFid = 19;
            break;
        case kDongManZhuanQu:
            fid = 5;
            subFid = 24;
            break;
        case kHTTPDownLoad:
            fid = 21;
            break;
        case kOnlineMovie:
            fid = 22;
            break;
        case kMovieField:
            fid = 10;
            fid = 23;
            break;
            
        default:
            break;
    }

    NSString *urlStr = [NSString stringWithFormat:@"%@%@?fid=%@",kDefalutHost, kDefalutUrl, @(fid)];
    NSString *subUrlStr = [NSString stringWithFormat:@"%@%@?fid=%@",kDefalutHost, kDefalutUrl, @(subFid)];

    return sub ? subUrlStr : urlStr;
}


#pragma mark -

+ (CLHomeModel *)createModelWithIconImage:(NSString *)iconImage
                              subIconText:(NSString *)subIconText
                                titleText:(NSString *)titleText
                               detailText:(NSString *)detailText
                            subDetailText:(NSString *)subDetailText
                                modelType:(KModelType)modelType{
    CLHomeModel *model = [[CLHomeModel alloc] init];
    model.iconImage = iconImage;
    model.subIconText = subIconText;
    model.titleText = titleText;
    model.detailText = detailText;
    model.subDetailText = subDetailText;
    model.modelType = modelType;
    return model;
}


@end
