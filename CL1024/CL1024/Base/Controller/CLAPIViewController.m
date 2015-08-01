//
//  CLAPIViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLAPIViewController.h"
#import "UIKit+AFNetworking.h"
#import "AFNetworking.h"
#import "CLFieldListModel.h"

@implementation CLAPIViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)reloadResponseData{

}

- (void)requestMainWithPageIndex:(NSInteger)pageIndex Success:(void (^)(BOOL success, NSArray *newData))success{
    NSString *newUrl = [NSString stringWithFormat:@"%@&search=&page=%ld",self.url,pageIndex];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:newUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *items = [CLFieldListModel parseFieldListWithData:responseObject];
        self.model = (id)items;
        success(YES,items);

        if (pageIndex==1) {
            [CLCoreDataManager DeleteAllModelFromManagedObjectContextModelWithEntityName:self.entityName];
            
            [items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [CLCoreDataManager insertIntoDataSourceModel:obj entityName:self.entityName];
            }];
        }
        [self reloadResponseData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        success(NO, self.model);
    }];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [queue addOperation:operation];
    
}

- (NSString *)entityName{
  return   @"";
}

@end
