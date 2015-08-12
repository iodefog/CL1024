//
//  CLFieldListModel.m
//  CL1024
//
//  Created by LiHongli on 15/7/26.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListModel.h"
#import "GDataXMLNode.h"
#import "RTLabel.h"
@implementation CLFieldListModel

- (void)parseFieldListWithData:(GDataXMLNode *)node index:(NSInteger)index{
    self.author  = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[3]/a", index] error:nil] stringValue];
    self.time = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[3]/div", index] error:nil] stringValue];
    self.titleStr =  [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[2]/h3/a", index] error:nil] stringValue];
    GDataXMLNode *element = [node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[2]/h3/a", index] error:nil] ;
    RTLabelExtractedComponent *component = [RTLabel extractTextStyleFromText:[element XMLString] paragraphReplacement:@"\n"];
    self.url = [self getValueToUrlWithArray:component.textComponents];
    self.title = (element.children.count > 0) ? [element.children[0] XMLString] : @"";
    self.commentCount = [[node firstNodeForXPath:[NSString stringWithFormat:@"//tr[%ld]/td[4]", index] error:nil] stringValue];
}


- (NSString *)getValueToUrlWithArray:(NSArray *)textComponents{
    NSString *url = nil;
    for (RTLabelComponent *component in textComponents) {
        NSString *href = component.attributes[@"href"];
        if (href) {
            url = [NSString stringWithFormat:@"%@%@",kDefalutHost,href];
            break;
        }
    }
    return url;
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
        if (!isBlankString(model.title)) {
            [modelsArray addObject:model];
        }
    }
    return modelsArray;
}

+ (NSInteger)parseFieldCountWithData:(NSData *)data{
    //将gb2312转换为  utf8
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);
    NSString *str = [[NSString alloc] initWithData:data encoding:enc];
    NSError *error = nil;
    GDataXMLDocument *html = [[GDataXMLDocument alloc] initWithHTMLString:str error:&error];
    DLog(@"******* %@", error);
    GDataXMLNode *element = [[html rootElement] childAtIndex:2];
    GDataXMLNode *node = [element firstNodeForXPath:@"//*[@id=\"last\"]" error:&error];
    DLog(@"******* %@", error);
    NSString *page = [node XMLString];
    NSString *regex = @"(?=page).*?(?=\")";
    NSString *result = nil;
    NSRange range = [page rangeOfString:regex options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        result = [[page substringWithRange:range] stringByReplacingOccurrencesOfString:@"page=" withString:@""];
    }
    
    return [result integerValue];
}

@end
