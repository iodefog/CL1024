
//
//  CLFieldListViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/25.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLFieldListViewController.h"
#import "CLFieldViewController.h"
#import "CLFieldListCell.h"
#import "CLBottomView.h"
#import "MJRefresh.h"

@interface CLFieldListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CLBottomView *bottomView;

@end

@implementation CLFieldListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageIndex = 1;
    [self.view addSubview:self.tableView];
    self.bottomView = [[CLBottomView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 45)];
    [self.view addSubview:self.bottomView];
    
    [self layoutSubViews];
    
    self.model = [CLFieldListModel queryFromManagedObjectContext];
    [self.tableView reloadData];
    
    __block typeof(self) mySelf = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        if (mySelf.pageIndex > 1) {
            mySelf.pageIndex--;
        }
        [mySelf requestHeader];
    }];
    [self.tableView.header beginRefreshing];
}

- (void)requestHeader{
    __block typeof(self) mySelf = self;
    [self requestMainWithPageIndex:self.pageIndex Success:^(BOOL Success,NSArray *newItems) {
        // 进入刷新状态后会自动调用这个block
        [mySelf.tableView.header endRefreshing];
    }];
}

- (void)requestFooter{
    __block typeof(self) mySelf = self;
    [self requestMainWithPageIndex:self.pageIndex Success:^(BOOL Success,NSArray *newItems) {
        // 进入刷新状态后会自动调用这个block
        [mySelf.tableView.footer endRefreshing];
    }];
}


- (void)layoutSubViews{
    self.tableView.frame = self.view.bounds;
    CGFloat screenHeight = kScreenHeight;
    CGFloat navHeight = kNavHeight;
    self.tableView.height = screenHeight - navHeight;
    self.bottomView.bottom = self.tableView.bottom;
}

- (void)reloadResponseData{
    [self.tableView reloadData];
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, self.tableView.width, self.tableView.height) animated:YES];
    __block typeof(self) mySelf = self;
    if (self.model.count > 10) {
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            mySelf.pageIndex++;
            [mySelf requestFooter];
        }];
    }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CLFieldListCell *cell = (CLFieldListCell *)[tableView cellForRowAtIndexPath:indexPath];
    CLFieldViewController *fieldVC = [[CLFieldViewController alloc] init];
    CLFieldListModel *model = self.model[indexPath.row];
    fieldVC.title = model.titleStr;
    fieldVC.url = cell.url;
    [self.navigationController pushViewController:fieldVC animated:YES];
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
