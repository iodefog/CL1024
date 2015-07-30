//
//  CLFieldListModel.m
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListModel.h"
#import "GDataXMLNode.h"
#import "AppDelegate.h"

@implementation CLFieldListModel

- (void)parseFieldListWithData:(GDataXMLNode *)node index:(NSInteger)index{
    self.author  = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[3]/a", index] error:nil] stringValue];
    self.time = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[3]/div", index] error:nil] stringValue];
    self.titleStr =  [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[2]/h3/a", index] error:nil] stringValue];
    self.title = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[2]/h3/a", index] error:nil] XMLString];
    self.commentCount = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[4]", index] error:nil] stringValue];
}

+ (NSMutableArray *)parseFieldListWithData:(NSData *)data{
    //将gb2312转换为  utf8
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
    NSString *str = [[NSString alloc] initWithData:data encoding:enc];
    NSError *error = nil;
    GDataXMLDocument *html = [[GDataXMLDocument alloc] initWithHTMLString:str error:&error];
    DLog(@"******* %@", error);
    GDataXMLNode *element = [[html rootElement] childAtIndex:2];
    GDataXMLNode *node = [element firstNodeForXPath:@"//*[@id=\"ajaxtable\"]/tbody[1]" error:&error];
    DLog(@"******* %@", error);
    NSMutableArray *modelsArray = [NSMutableArray array];
    for (int index = 0; index < node.childCount; index++) {
        CLFieldListModel *model = [[CLFieldListModel alloc] init];
        [model parseFieldListWithData:node index:index];
        if (model.title) {
            [modelsArray addObject:model];
        }
    }
    return modelsArray;
}

//插入数据
+ (void)insertIntoDataSourceModel:(CLFieldListModel *)model {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    CLFieldListModel *fieldModel=(CLFieldListModel *)[NSEntityDescription insertNewObjectForEntityForName:@"FieldList" inManagedObjectContext:delegate.managedObjectContext];
    fieldModel.titleStr = model.titleStr;
    fieldModel.title = model.title;
    fieldModel.commentCount = model.commentCount;
    fieldModel.time = model.time;
    fieldModel.author = model.author;
    
    NSError* error;
    BOOL isSaveSuccess=[delegate.managedObjectContext save:&error];
    if (!isSaveSuccess) {
        DLog(@"Error:%@",error);
    }else{
        DLog(@"Save successful!");
    }
}

//查询
+ (NSMutableArray *)queryFromManagedObjectContext {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"FieldList" inManagedObjectContext:delegate.managedObjectContext];
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
+ (void)updateModelFromManagedObjectContextModel:(CLFieldListModel *)model{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"FieldList" inManagedObjectContext:delegate.managedObjectContext];
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
+ (void)DeleteModelFromManagedObjectContextModel:(CLFieldListModel *)model{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"FieldList" inManagedObjectContext:delegate.managedObjectContext];
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
+ (void)DeleteAllModelFromManagedObjectContextModel{
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* user=[NSEntityDescription entityForName:@"FieldList" inManagedObjectContext:delegate.managedObjectContext];
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
