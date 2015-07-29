//
//  CLFieldViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/27.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldViewController.h"
#import "AFNetworking.h"
#import "GDataXMLNode.h"
#import "MarqueeLabel.h"

@interface CLFieldViewController ()

@property (nonatomic, strong)  UIWebView *webView;

@end

@implementation CLFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MarqueeLabel *label = [[MarqueeLabel alloc] initWithFrame:CGRectMake(0, 0, self.view.width-100,44)];
    label.tag = 101;
    label.text = self.title;
    label.textColor = [UIColor whiteColor];
    label.marqueeType = MLContinuous;
    label.scrollDuration = 15.0;
    label.animationCurve = UIViewAnimationOptionCurveEaseInOut;
    label.fadeLength = 10.0f;
    label.leadingBuffer = 30.0f;
    label.trailingBuffer = 20.0f;
    self.navigationItem.titleView = label;

    CGFloat screemHeight = kScreenHeight;
    CGFloat navHeight = kNavHeight;
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, screemHeight - navHeight)];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    __block __weak CLFieldViewController *mySelf = self;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:enc];
        NSError *error = nil;
        GDataXMLDocument *html = [[GDataXMLDocument alloc] initWithHTMLString:str error:&error];
        NSLog(@"******* %@", error);
        GDataXMLNode *element = [[html rootElement] childAtIndex:2];
        GDataXMLNode *node = [element firstNodeForXPath:@"//*[@id=\"main\"]/div[4]/table/tr[1]/th[2]/table/tr/td/div[4]" error:&error];
        
       NSString *htmls = [NSString stringWithFormat:@"<html> \n"
         "<head> \n"
         "<style type=\"text/css\"> \n"
         "body {font-family: \"%@\"; font-size: %f; }\n"
         "</style> \n"
         "</head> \n"
         "<body>%@</body> \n"
                        "</html>", @"宋体", 18.,[node XMLString]];
        
        [mySelf.webView loadHTMLString:htmls baseURL:nil];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [queue addOperation:operation];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    self.webView.scalesPageToFit = NO;

    
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%'";
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    //拦截网页图片  并修改图片大小
    NSString *script = [NSString stringWithFormat: @"var script = document.createElement('script');"
                        "script.type = 'text/javascript';"
                        "script.text = \"function ResizeImages() { "
                        "var myimg,oldwidth;"
                        "var maxwidth=%lf;" //缩放系数
                        "for(i=0;i <document.images.length;i++){"
                        "myimg = document.images[i];"
                        "if(myimg.width > maxwidth){"
                        "oldwidth = myimg.width;"
                        "myimg.width = maxwidth;"
                        "myimg.height = myimg.height * (maxwidth/oldwidth);"
                        "}"
                        "}"
                        "}\";"
                        "document.getElementsByTagName('head')[0].appendChild(script);",self.view.width-20];
    
    [webView stringByEvaluatingJavaScriptFromString:script];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];

//    CGFloat height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight"] floatValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
