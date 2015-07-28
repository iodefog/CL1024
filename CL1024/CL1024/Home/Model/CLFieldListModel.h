//
//  CLFieldListModel.h
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLFieldListModel : NSObject

@property (nonatomic, strong) NSString       *titleStr;
@property (nonatomic, strong) NSString       *title;
@property (nonatomic, strong) NSString       *author;
@property (nonatomic, strong) NSString       *time;
@property (nonatomic, strong) NSString       *commentCount;

+ (NSMutableArray *)parseFieldListWithData:(NSData *)data;
//插入数据
+ (void)insertIntoDataSourceModel:(CLFieldListModel *)model;
//查询
+ (NSMutableArray *)queryFromManagedObjectContext;
//更新
+ (void)updateModelFromManagedObjectContextModel:(CLFieldListModel *)model;
//删除
+ (void)DeleteModelFromManagedObjectContextModel:(CLFieldListModel *)mode;
//删除所有
+ (void)DeleteAllModelFromManagedObjectContextModel;

@end
