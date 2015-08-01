//
//  CLFieldListModel.m
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListModel.h"
#import "GDataXMLNode.h"

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

@end
