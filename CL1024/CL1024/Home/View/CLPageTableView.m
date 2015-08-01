//
//  CLPageTableView.m
//  CL1024
//
//  Created by LiHongli on 15/8/1.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLPageTableView.h"

@interface CLPageTableView()

@property (nonatomic, strong) NSMutableArray*pagesArray;

@end

@implementation CLPageTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.pagesArray = [NSMutableArray array];
    for (int i = 0; i < 100; i ++) {
        NSString *title = [NSString stringWithFormat:@"查看第%@页",@(i)];
        if (i == 0) {
            title = @"   当前页";
        }
        [self.pagesArray addObject:title];
    }
}

#pragma mark - TableView Delgate

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pagesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"pageTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = self.pagesArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.pageTableBlock) {
        self.pageTableBlock(indexPath);
    }
}

@end
