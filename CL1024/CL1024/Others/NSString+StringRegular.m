//
//  NSString+StringRegular.m
//  CL1024
//
//  Created by LiHongli on 15/8/15.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "NSString+StringRegular.h"
@implementation NSString (StringRegular)

-(NSMutableArray *)substringByRegular:(NSString *)regular{
    
    NSString * reg=regular;
    
    NSRange r= [self rangeOfString:reg options:NSRegularExpressionSearch];
    
    NSMutableArray *arr=[NSMutableArray array];
    
    if (r.length != NSNotFound &&r.length != 0) {
        
        int i=0;
        
        while (r.length != NSNotFound &&r.length != 0) {
            
            NSLog(@"index = %i regIndex = %ld loc = %ld",(++i),r.length,r.location);
            
            NSString* substr = [[self substringWithRange:r] stringByReplacingOccurrencesOfString:@"?" withString:@""];
            substr = [substr stringByReplacingOccurrencesOfString:@"______" withString:@"."];
            NSLog(@"substr = %@",substr);
            [arr addObject:substr];
            NSRange startr=NSMakeRange(r.location+r.length, [self length]-r.location-r.length);
            
            r=[self rangeOfString:reg options:NSRegularExpressionSearch range:startr];
        }
    }
    return arr;
}

@end
