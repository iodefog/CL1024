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

- (void)requestMain{
    NSString *newUrl = [NSString stringWithFormat:@"%@&search=&page=1",self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:newUrl]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.model = [CLFieldListModel parseFieldListWithData:responseObject];
        [self reloadResponseData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [queue addOperation:operation];
    
}
@end
