//
//  CLFieldListCell.h
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLFieldListModel.h"

@interface CLFieldListCell : UITableViewCell

@property (nonatomic, strong) NSString *url;

- (void)setObject:(id)item;

@end
