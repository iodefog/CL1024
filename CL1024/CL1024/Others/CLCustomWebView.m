//
//  CLCustomWebView.m
//  CL1024
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLCustomWebView.h"

@implementation CLCustomWebView

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    scrollView.showsHorizontalScrollIndicator = NO;
    if (scrollView.contentOffset.x > 0){
        scrollView.contentOffset = CGPointMake(0, scrollView.contentOffset.y);
    }
}

@end
