//
//  CLCoreDataManager.h
//  CL1024
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLFieldListModel.h"
@interface CLCoreDataManager : NSObject

//插入数据
+ (void)insertIntoDataSourceModel:(CLFieldListModel *)model  entityName:(NSString *)entityName;
//查询
+ (NSMutableArray *)queryFromManagedObjectContextWithEntityName:(NSString *)entityName;
//更新
+ (void)updateModelFromManagedObjectContextModel:(CLFieldListModel *)model  entityName:(NSString *)entityName;
//删除
+ (void)DeleteModelFromManagedObjectContextModel:(CLFieldListModel *)mode  entityName:(NSString *)entityName;
//删除所有
+ (void)DeleteAllModelFromManagedObjectContextModelWithEntityName:(NSString *)entityName;


@end
