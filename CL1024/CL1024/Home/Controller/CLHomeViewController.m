//
//  CLHomeViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLHomeViewController.h"
#import "AKSegmentedControl.h"
#import "CLHomeTableCell.h"
#import "CLFieldListViewController.h"

@interface CLHomeViewController() <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) AKSegmentedControl    *segmentedControl;
@property (nonatomic, strong) UIButton              *headButton;
@property (nonatomic, strong) UIScrollView          *tableContentView;
@property (nonatomic, strong) UITableView           *clRestTableView;
@property (nonatomic, strong) UITableView           *clMoveTableView;
@property (nonatomic, strong) NSArray               *clRestArray;
@property (nonatomic, strong) NSArray               *clMoveArray;

@property(nonatomic,weak) UIViewController          *currentShowVC;


@end

@implementation CLHomeViewController

- (void)layoutSubViews{
    CGFloat navHeight = kNavHeight;
    self.segmentedControl.frame = CGRectMake(0, 0, self.view.width, 44);
    self.headButton.frame = CGRectMake(0, self.segmentedControl.bottom, self.view.width, 30);
    self.tableContentView.frame = CGRectMake(0, self.headButton.bottom, self.view.width, self.view.height - navHeight - self.headButton.bottom);
    self.tableContentView.contentSize = CGSizeMake(_tableContentView.width*2, _tableContentView.height);
    self.clRestTableView.frame = self.tableContentView.bounds;
    self.clMoveTableView.frame = self.tableContentView.bounds;
    self.clMoveTableView.left = self.clRestTableView.right;
}

- (void)viewDidAppear:(BOOL)animated;{
    [super viewDidAppear:animated];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.IIVDC setSlidesOnPanGesture:YES];
}

- (void)viewDidDisappear:(BOOL)animated;{
    [super viewDidDisappear:animated];
    
   AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate.IIVDC setSlidesOnPanGesture:NO];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title  = @"草榴社区";
    self.view.backgroundColor = UIColorFromRGB(0xf9f9ed);
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.delegate =(id)self;

    self.navigationItem.leftBarButtonItem = [self createButtonWithImage:@"icon_main_setting" SEL:@selector(clickedSetting:) left:YES];
    self.navigationItem.rightBarButtonItem = [self createButtonWithImage:@"icon_main_person" SEL:@selector(clickedPerson:) left:NO];
    
    [self intanceData];
    
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.headButton];
    [self.view addSubview:self.tableContentView];
    [self.tableContentView addSubview:self.clRestTableView];
    [self.tableContentView addSubview:self.clMoveTableView];
    
    [self layoutSubViews];
}

- (void)intanceData{
    CLHomeModel *a_Model1 = [CLHomeModel createModelWithIconImage:@"icon_technical_discussion" subIconText:nil titleText:@"技术讨论区" detailText:@"日常生活 兴趣交流 时事经济 求助求档 会员闲谈吹水区" subDetailText:nil modelType:kTechComment];
    CLHomeModel *a_Model2 = [CLHomeModel createModelWithIconImage:@"icon_new_era" subIconText:nil titleText:@"新时代的我们" detailText:@"草榴贴图区 加大你的带宽！ 加大你的内存！加大你的显示器！" subDetailText:nil modelType:kNewUs];
    CLHomeModel *a_Model3 = [CLHomeModel createModelWithIconImage:@"icon_daguerre" subIconText:nil titleText:@"连蓝雨的旗帜" detailText:@"草榴自拍区\n分享你我管权限的最美" subDetailText:nil modelType:kOurFlag];
    CLHomeModel *a_Model4 = [CLHomeModel createModelWithIconImage:@"icon_literature_exchange" subIconText:nil titleText:@"成人文学交流区" detailText:@"草榴文学区\n欢迎各位发表" subDetailText:nil modelType:kTextQu];
    CLHomeModel *a_Model5 = [CLHomeModel createModelWithIconImage:@"icon_information" subIconText:nil titleText:@"草榴咨询" detailText:@"公告有关本站最新动向 会员须知 请经常来看看" subDetailText:nil modelType:kCLZixun];
    self.clRestArray = @[a_Model1, a_Model2, a_Model3, a_Model4, a_Model5];

// -----------------------------------------------------------------------------------------------
    
    CLHomeModel *b_Model1 = [CLHomeModel createModelWithIconImage:@"icon_asia_codeless_original" subIconText:@"子版块" titleText:@"亚洲无码原创区" detailText:@"自由发布亚洲最新无修正资讯片 亚洲无码AV大联盟" subDetailText:@"亚洲无码转帖交流区" modelType:kWuMaZhuanQu];
    CLHomeModel *b_Model2 = [CLHomeModel createModelWithIconImage:@"icon_asia_ovod_original" subIconText:@"子版块" titleText:@"亚洲有码原创区" detailText:@"自由发布亚洲最新有修正资讯片 以及三级等其他资讯片" subDetailText:@"亚洲有码转帖区" modelType:kYouMaZhuanQu];
    CLHomeModel *b_Model3 = [CLHomeModel createModelWithIconImage:@"icon_western_original" subIconText:@"子版块" titleText:@"欧美原创区" detailText:@"自由发布纯正的欧美成人资讯片" subDetailText:@"欧美转帖专区" modelType:kOuMeiZhuanQu];
    CLHomeModel *b_Model4 = [CLHomeModel createModelWithIconImage:@"icon_cartoon_original" subIconText:@"子版块" titleText:@"动漫原创专区" detailText:@"自由发布任何H动画漫画" subDetailText:@"动漫转帖区" modelType:kDongManZhuanQu];
    CLHomeModel *b_Model5 = [CLHomeModel createModelWithIconImage:@"icon_http_download" subIconText:nil titleText:@"HTTP下载区" detailText:@"自由发布各类HTTP/Ray/eMule等方式下载" subDetailText:nil modelType:kHTTPDownLoad];
    CLHomeModel *b_Model6 = [CLHomeModel createModelWithIconImage:@"icon_online_movie" subIconText:nil titleText:@"在线成人影院" detailText:@"在线欣赏 \n即点即看" subDetailText:nil modelType:kOnlineMovie];
    CLHomeModel *b_Model7 = [CLHomeModel createModelWithIconImage:@"icon_movie_storage" subIconText:@"子版块" titleText:@"草榴影视库" detailText:@"发布2-3个月后的帖子，会转移到这里，保留一段时间后，删除(会员可看)" subDetailText:@"博彩区" modelType:kMovieField];

    self.clMoveArray = @[b_Model1, b_Model2, b_Model3, b_Model4, b_Model5, b_Model6, b_Model7];
}


- (void)clRestField:(UIButton *)sender{
    [self.segmentedControl setSelectedIndex:0];
    [self.tableContentView scrollRectToVisible:CGRectMake(0, 0, self.tableContentView.width, self.tableContentView.height) animated:YES];
}

- (void)clMoveDownload:(UIButton *)sender{
    [self.segmentedControl setSelectedIndex:1];
    [self.tableContentView scrollRectToVisible:CGRectMake(self.tableContentView.width, 0, self.tableContentView.width, self.tableContentView.height) animated:YES];
}

- (void)headButtonClicked:(UIButton *)sender{

}

- (void)pushToFieldListVCWithUrl:(CLHomeModel *)model{
    CLFieldListViewController *fieldListVC = [[CLFieldListViewController alloc] init];
    fieldListVC.url = model.url;
    fieldListVC.modelType = model.modelType;
    fieldListVC.title = model.titleText;
    [self.navigationController pushViewController:fieldListVC animated:YES];
}

#pragma mark - TabelView Method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sectionCount = 0;
    if(tableView == self.clMoveTableView){
        sectionCount = self.clMoveArray.count;
    }else if(tableView == self.clRestTableView){
        sectionCount = self.clRestArray.count;
    }
    return sectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLHomeModel *model = nil;
    if(tableView == self.clMoveTableView){
        model = self.clMoveArray[indexPath.section];
    }else if(tableView == self.clRestTableView){
        model = self.clRestArray[indexPath.section];
    }
    return model.needSubIcon ? 212/2. : 160/2.;
}

- (CLHomeTableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"HomeTableCell";
    CLHomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    if(tableView == self.clMoveTableView){
        [cell setObject:self.clMoveArray[indexPath.section]];
    }else if(tableView == self.clRestTableView){
        [cell setObject:self.clRestArray[indexPath.section]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CLHomeModel *model = nil;
    if(tableView == self.clMoveTableView){
        model = self.clMoveArray[indexPath.section];
    }else if(tableView == self.clRestTableView){
        model = self.clRestArray[indexPath.section];
    }
    
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(pushToFieldListVCWithUrl:) object:model];;
    [self performSelector:@selector(pushToFieldListVCWithUrl:) withObject:model afterDelay:0.2];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableContentView) {
        if (scrollView.contentOffset.x > scrollView.width/2) {
            [self.segmentedControl setSelectedIndex:1];
        }else {
            [self.segmentedControl setSelectedIndex:0];
        }
    }
}

#pragma mark - 

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.viewControllers.count == 1)
        self.currentShowVC = Nil;
    else
        self.currentShowVC = viewController;
}


#pragma mark - 

- (AKSegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = [[AKSegmentedControl alloc] initWithFrame:CGRectZero];
        _segmentedControl.buttonsArray = @[[self createButtonWithTitle:@"草榴休闲区" sel:@selector(clRestField:)],
                                           [self createButtonWithTitle:@"BT电影下载区" sel:@selector(clMoveDownload:)]
                                           ];
        [_segmentedControl setSelectedIndex:0];
    }
    return _segmentedControl;
}

- (UIButton *)headButton{
    if (!_headButton) {
        _headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headButton setTitle:@"新版本发布通知" forState:UIControlStateNormal];
        _headButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _headButton.layer.borderWidth = 0.5;
        _headButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [_headButton setTitleColor:UIColorFromRGB(0xafafaf) forState:UIControlStateNormal];
        [_headButton addTarget:self action:@selector(headButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headButton;
}


- (UITableView *)clRestTableView{
    if (!_clRestTableView) {
        _clRestTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _clRestTableView.backgroundColor = UIColorFromRGB(0xf9f9ed);
        _clRestTableView.delegate = self;
        _clRestTableView.dataSource = self;
        [_clRestTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_clRestTableView registerClass:[CLHomeTableCell class] forCellReuseIdentifier:@"HomeTableCell"];
        _clRestTableView.tableFooterView = [UIView new];
    }
    return _clRestTableView;
}

- (UITableView *)clMoveTableView{
    if (!_clMoveTableView) {
        _clMoveTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_clMoveTableView registerClass:[CLHomeTableCell class] forCellReuseIdentifier:@"HomeTableCell"];
        [_clMoveTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _clMoveTableView.backgroundColor = UIColorFromRGB(0xf9f9ed);
        _clMoveTableView.delegate = self;
        _clMoveTableView.dataSource = self;
        _clMoveTableView.tableFooterView = [UIView new];
    }
    return _clMoveTableView;
}

- (UIScrollView *)tableContentView{
    if (!_tableContentView) {
        _tableContentView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _tableContentView.showsHorizontalScrollIndicator = NO;
        _tableContentView.pagingEnabled = YES;
        _tableContentView.bounces =  NO;
        _tableContentView.delegate = self;

    }
    return _tableContentView;
}



#pragma mark - -

- (UIButton *)createButtonWithTitle:(NSString *)title sel:(SEL)sel{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:UIColorFromRGB(0xafafaf) forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB(0x405f62) forState:UIControlStateSelected];
    return button;
}

@end
