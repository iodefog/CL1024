//
//  CLBottomView.h
//  CL1024
//
//  Created by LiHongli on 15/7/30.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    CLSelectField,
    CLSeeCache,
    CLReloadFirst,
    CLSelectPage
} CLBottomClickedType;

typedef void(^CLBottomViewBlock)(NSInteger index, CLBottomClickedType buttomType);


@interface CLBottomView : UIView

@property (nonatomic, assign) NSInteger         pageCurrentIndex;
@property (nonatomic, strong) CLBottomViewBlock bottomBlock;

@end
