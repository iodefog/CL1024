//
//  CLFieldViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/27.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldViewController.h"
#import "CLBottomView.h"
#import "AFNetworking.h"
#import "GDataXMLNode.h"
#import "MarqueeLabel.h"
#import "CLCustomWebView.h"
@interface CLFieldViewController ()

@property (nonatomic, strong)  NSString         *tid;
@property (nonatomic, strong)  CLCustomWebView  *webView;
@property (nonatomic, strong)  CLBottomView     *bottomView;
@end

@implementation CLFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.tid = [[[NSURL URLWithString:self.url] lastPathComponent] stringByDeletingPathExtension];
    self.navigationItem.titleView = self.marqueeLabel;
    [self.view addSubview:self.webView];
    __block typeof(self) mySelf = self;
    self.bottomView = [[CLBottomView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    self.bottomView.bottomBlock = ^(NSInteger index, CLBottomClickedType bottomType){
        DLog(@"index = %@, buttomType = %@", @(index), @(bottomType));
        if(index != mySelf.pageIndex){
            mySelf.pageIndex = index;
            [mySelf reloadRequestData];
        }
        mySelf.pageIndex = index;

    };
    [self.view addSubview:self.bottomView];
    [self layoutSubViews];

    [self reloadRequestData];
}

- (void)reloadRequestData{
    self.url = [NSString stringWithFormat:@"%@%@?tid=%@&page=%@",kDefalutHost,@"read.php",self.tid,@(self.pageIndex)];
//    self.url = @"http://cc.bearhk.info/read.php?tid=1598848&page=1";
    
    [self showProgressHUD];
    __block typeof(self) mySelf = self;
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [mySelf hideProgressHUD];
        NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:enc];
        NSError *error = nil;
        GDataXMLDocument *html = [[GDataXMLDocument alloc] initWithHTMLString:str error:&error];
        DLog(@"******* %@", error);
        GDataXMLNode *element = [[html rootElement] childAtIndex:2];
        GDataXMLNode *node = [element firstNodeForXPath:@"//*[@id=\"main\"]/div[3]/table/tr[1]/th[2]/table/tr/td/div[4]" error:&error];
        DLog(@"******* %@", error);
        mySelf.pageCount = [[[element firstNodeForXPath:@"//*[@id=\"main\"]/div[2]/table/tr/td[1]/div/a[5]" error:&error] stringValue] integerValue];
        DLog(@"******* %@", error);
        if (mySelf.bottomView.pageCount == -1) {
            mySelf.bottomView.pageCount = mySelf.pageCount;
        }
        
        NSString *htmls = [NSString stringWithFormat:@"<html> \n"
                           "<head> \n"
                           "<link rel=\"stylesheet\" href=\"http://www.viidii.info/web/style.css?v=1.948\" type=\"text/css\">"
                           "<style type=\"text/css\"> \n"
                           "body {font-family: \"%@\"; font-size: %f; }\n"
                           "</style> \n"
                           "</head> \n"
                           "<body>%@</body> \n"
                           "</html>", @"宋体", 18.,[node XMLString]];
        [mySelf.webView loadHTMLString:htmls baseURL:nil];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [mySelf hideProgressHUD];
        [mySelf showToastMessage:@"加载失败"];
    }];
    
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [queue addOperation:operation];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    // 修改文字
    NSString *meta = [NSString stringWithFormat:@"document.getElementsByName(\"viewport\")[0].content = \"width=%@, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes\"",@(self.view.width-20)];
    [webView stringByEvaluatingJavaScriptFromString:meta];//(initial-scale是初始缩放比,minimum-scale=1.0最小缩放比,maximum-scale=5.0最大缩放比,user-scalable=yes是否支持缩放)

//    return;
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
                        "myimg.height = myimg.height*maxwidth/oldwidth+20;"
                        "}"
                        "}"
                        "}\";"
                        "document.getElementsByTagName('head')[0].appendChild(script);",self.view.width-60];
    
    [webView stringByEvaluatingJavaScriptFromString:script];
    [webView stringByEvaluatingJavaScriptFromString:@"ResizeImages();"];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (request.URL.query) {
        [self showPreViewImageView:request.URL.query];
        return NO;
    }
    return YES;
}


- (void)layoutSubViews{
    [super layoutSubViews];
    CGFloat screemHeight = kScreenHeight;
    CGFloat navHeight = kNavHeight;
    self.webView.frame = CGRectMake(10, 0, self.view.width-20, screemHeight - navHeight-self.bottomView.height);
    self.bottomView.top = self.webView.bottom;
}

- (MarqueeLabel *)marqueeLabel{
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
    return label;
}

- (CLCustomWebView *)webView{
    if (!_webView) {
        _webView = [[CLCustomWebView alloc] initWithFrame:CGRectZero];
        _webView.delegate = self;
        _webView.scalesPageToFit = NO;
    }
    return _webView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > 0)
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
