//
//  CLCoreDataManager.m
//  CL1024
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLCoreDataManager.h"
#import "AppDelegate.h"

@implementation CLCoreDataManager

//插入数据
+ (void)insertIntoDataSourceModel:(CLFieldListModel *)model entityName:(NSString *)entityName{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    CLFieldListModel *fieldModel=(CLFieldListModel *)[NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:delegate.managedObjectContext];
    fieldModel.titleStr = model.titleStr;
    fieldModel.title = model.title;
    fieldModel.commentCount = model.commentCount;
    fieldModel.time = model.time;
    fieldModel.author = model.author;
    fieldModel.url = model.url;

    NSError* error;
    BOOL isSaveSuccess=[delegate.managedObjectContext save:&error];
    if (!isSaveSuccess) {
        DLog(@"Error:%@",error);
    }else{
        DLog(@"Save successful!");
    }
}

//查询
+ (NSMutableArray *)queryFromManagedObjectContextWithEntityName:(NSString *)entityName{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:entityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:user];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        DLog(@"Error:%@",error);
    }
    DLog(@"The count of entry: %li",[mutableFetchResult count]);
    //    for (CLFieldListModel* user in mutableFetchResult) {
    //        DLog(@"%@",user.properties_aps);
    //    }
    return mutableFetchResult;
}

//更新
+ (void)updateModelFromManagedObjectContextModel:(CLFieldListModel *)model  entityName:(NSString *)entityName{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:entityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:user];
    //查询条件
    NSPredicate* predicate=[NSPredicate predicateWithFormat:@"title==%@",@"xxx"];
    [request setPredicate:predicate];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        DLog(@"Error:%@",error);
    }
    DLog(@"The count of entry: %li",[mutableFetchResult count]);
    //更新age后要进行保存，否则没更新
    for (CLFieldListModel *item in mutableFetchResult) {
        item.titleStr = model.titleStr;
        item.title  = model.title;
        item.time = model.time;
        item.commentCount = model.commentCount;
        item.author = model.author;
    }
    [delegate.managedObjectContext save:&error];
    
}
//删除
+ (void)DeleteModelFromManagedObjectContextModel:(CLFieldListModel *)model  entityName:(NSString *)entityName{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:entityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:user];
    NSPredicate* predicate=[NSPredicate predicateWithFormat:@"name==%@",@"chen"];
    [request setPredicate:predicate];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        DLog(@"Error:%@",error);
    }
    DLog(@"The count of entry: %li",[mutableFetchResult count]);
    for (CLFieldListModel* item in mutableFetchResult) {
        [delegate.managedObjectContext deleteObject:(id)item];
    }
    
    if ([delegate.managedObjectContext save:&error]) {
        DLog(@"Error:%@,%@",error,[error userInfo]);
    }
}

//删除所有
+ (void)DeleteAllModelFromManagedObjectContextModelWithEntityName:(NSString *)entityName{
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:entityName inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:user];
    NSError* error=nil;
    NSMutableArray* mutableFetchResult=[[delegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult==nil) {
        DLog(@"Error:%@",error);
    }
    DLog(@"The count of entry: %li",[mutableFetchResult count]);
    for (CLFieldListModel* item in mutableFetchResult) {
        //        DLog(@"%@",user.properties_aps);
        [delegate.managedObjectContext deleteObject:(id)item];
    }
    
    if ([delegate.managedObjectContext save:&error]) {
        DLog(@"Error:%@,%@",error,[error userInfo]);
    }
}


@end
