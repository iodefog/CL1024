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
    self.url = [NSURL URLWithString:@"http://cc.bearhk.info/thread0806.php?fid=7&search=&page=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
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
