//
//  CLSettingViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLSettingViewController.h"
#import "CLSettingCell.h"

@interface CLSettingViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray       *itemsArray;
@property (nonatomic, strong) UITableView   *tableView;

@end

@implementation CLSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    [self instanceData];
    [self createUI];
    
}

- (void)instanceData{
    //1
    CLSettingModel *share = [CLSettingModel createSettingModelWithImage:@"setting_share" title:@"分享出去"];
    //2
    CLSettingModel *swipeback = [CLSettingModel createSettingModelWithImage:@"setting_swipe_back" title:@"右滑返回"];
    CLSettingModel *showimage = [CLSettingModel createSettingModelWithImage:@"setting_show_image" title:@"显示图片"];
    CLSettingModel *trafficcontrol = [CLSettingModel createSettingModelWithImage:@"setting_traffic_control" title:@"流量控制"];
    //3
    CLSettingModel *newversion = [CLSettingModel createSettingModelWithImage:@"setting_check_new_versions" title:@"检测新版" ];
    CLSettingModel *clearcache = [CLSettingModel createSettingModelWithImage:@"setting_clear_cache" title:@"清理缓存"];
    //4
    CLSettingModel *password = [CLSettingModel createSettingModelWithImage:@"setting_pass_word" title:@"软件密码"];
    CLSettingModel *editurl = [CLSettingModel createSettingModelWithImage:@"setting_edit_url" title:@"修改地址"];
    CLSettingModel *fontsize = [CLSettingModel createSettingModelWithImage:@"setting_font_size" title:@"字体大小"];
    CLSettingModel *usinghelp = [CLSettingModel createSettingModelWithImage:@"setting_using_help" title:@"使用帮助"];
    CLSettingModel *aboutus = [CLSettingModel createSettingModelWithImage:@"setting_about_us" title:@"关于软件"];
    
    self.itemsArray = @[@[share],
                        @[swipeback, showimage, trafficcontrol],
                        @[newversion, clearcache],
                        @[password, editurl, fontsize, usinghelp, aboutus]];

}

- (void)createUI{
    [self.tableView registerClass:[CLSettingCell class] forCellReuseIdentifier:@"SettingCell"];
    [self.view addSubview:self.tableView];
}


#pragma mark - TableView Method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.itemsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.itemsArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}

- (CLSettingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"SettingCell";
    CLSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    [cell setObject:self.itemsArray[indexPath.section][indexPath.row] ];
    
    return cell;
}

#pragma mark - Create View

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
