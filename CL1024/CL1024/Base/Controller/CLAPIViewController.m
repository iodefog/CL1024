//
//  CLAPIViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLAPIViewController.h"
#import "UIKit+AFNetworking.h"
#import "CLFieldListModel.h"

@implementation CLAPIViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

- (void)reloadResponseData{

}

- (void)requestMain{
    self.url = [NSURL URLWithString:@"http://cc.bearhk.info/thread0806.php?fid=7&search=&page=1"];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:self.url] MIMEType:@"text/html" textEncodingName:nil progress:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        
    } success:^NSData *(NSHTTPURLResponse *response, NSData *data) {
        self.model = [CLFieldListModel parseFieldListWithData:data];
        [self reloadResponseData];
        return data;
    } failure:^(NSError *error) {
        
    }];
    [self.view addSubview:webView];
    
}
@end
