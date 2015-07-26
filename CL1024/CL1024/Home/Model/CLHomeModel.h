//
//  CLHomeModel.h
//  CL1024
//
//  Created by LiHongli on 15/7/25.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kWuMaZhuanQu,
    kYouMaZhuanQu,
    kOuMeiZhuanQu,
    kDongManZhuanQu,
    kHTTPDownLoad,
    kOnlineMovie,
    kMovieField,
    
    kTechComment,
    kNewUs,
    kOurFlag,
    kTextQu,
    kCLZixun
} KModelType;

@interface CLHomeModel : NSObject

@property (nonatomic, strong) NSString    *iconImage;
@property (nonatomic, strong) NSString    *subIconText;
@property (nonatomic, strong) NSString    *titleText;
@property (nonatomic, strong) NSString    *detailText;
@property (nonatomic, strong) NSString    *subDetailText;
@property (nonatomic, strong) NSURL       *url;
@property (nonatomic, strong) NSURL       *subUrl;
@property (nonatomic, assign) KModelType  modelType;
@property (nonatomic, assign) BOOL        needSubIcon;

+ (CLHomeModel *)createModelWithIconImage:(NSString *)iconImage
                              subIconText:(NSString *)subIconText
                                titleText:(NSString *)titleText
                               detailText:(NSString *)detailText
                            subDetailText:(NSString *)subDetailText
                                      modelType:(KModelType)modelType;

@end
