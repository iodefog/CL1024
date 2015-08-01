//
//  CLPageTableView.h
//  CL1024
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CLPageTableBlock)(NSIndexPath *indexPath);

@interface CLPageTableView : UITableView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) CLPageTableBlock pageTableBlock;

@end
