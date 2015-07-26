//
//  CLFieldListViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/25.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListViewController.h"
#import "CLFieldListCell.h"

@interface CLFieldListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CLFieldListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestMain];
    
    [self.view addSubview:self.tableView];
    
    [self layoutSubViews];
}

- (void)layoutSubViews{
    self.tableView.frame = self.view.bounds;
    CGFloat screenHeight = kScreenHeight;
    CGFloat navHeight = kNavHeight;
    self.tableView.height = screenHeight - navHeight;
}

- (void)reloadResponseData{
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITabelView Method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142/2.;
}

- (CLFieldListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLFieldListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CLFieldListCell" forIndexPath:indexPath];
    [cell setObject:self.model[indexPath.row]];
    return cell;
}

#pragma mark -  Create View

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[CLFieldListCell class] forCellReuseIdentifier:@"CLFieldListCell"];
    }
    return _tableView;
}


@end
