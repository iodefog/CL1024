//
//  CLPersonViewController.m
//  CL1024
//
//  Created by LiHongli on 15/7/17.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLPersonViewController.h"
#import "CLPersonItemView.h"

@interface CLPersonViewController()

@property (nonatomic, strong) UIImageView *headContentView;

@end

@implementation CLPersonViewController

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
    
    self.title  = @"person";
    self.navigationItem.leftBarButtonItem = nil;
    [self createHeadView];
    [self createSubView];
    [self createBottomView];
}


- (void)createHeadView{
    [self.view addSubview:self.headContentView];
}

- (void)createSubView{
    NSArray *titleArray = @[@"消息",@"资料",@"帖子",@"收藏",@"地址",@"搜索"];
    NSArray *imageArray = @[@"person_icon_message",
                            @"person_icon_post",
                            @"person_icon_datum",
                            @"person_icon_favorites",
                            @"person_icon_offline",
                            @"person_icon_search"];
    
    for (int i = 0; i < 6; i ++) {
        CLPersonItemView *personItemView = [CLPersonItemView buttonWithType:UIButtonTypeCustom];
        [personItemView createUI];
        personItemView.tag = 100+i;
        if(i%2 == 0){
            personItemView.frame = CGRectMake(42/2, self.headContentView.bottom+30/2+(i/2)*(190/2), 180/2, 180/2);
        }else{
            personItemView.frame = CGRectMake(42/2+180/2+10/2, self.headContentView.bottom+30/2+(i/2)*(190/2), 180/2, 180/2);
        }
        personItemView.kTitleLabel.text = titleArray[i];
        personItemView.icon.image = [UIImage imageNamed:imageArray[i]];
        [personItemView addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:personItemView];
    }
}

- (void)createBottomView{
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutButton.frame = CGRectMake(30/2 ,self.view.bottom - 120/2, 160/2, 60/2);
    [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutButton setTitleColor:UIColorFromRGB(0xcce2df) forState:UIControlStateNormal];
    UIImage *bgImage = [UIImage imageNamed:@"login_bt_bg"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width/2 topCapHeight:bgImage.size.height/2];
    [logoutButton setBackgroundImage:bgImage forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logoutClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
}

- (UIImageView *)headContentView{
    if (!_headContentView) {
        _headContentView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200/2)];
        _headContentView.image = [UIImage imageNamed:@"nav_bg_ios6"];
        
        UIButton *headButton = [UIButton buttonWithType:UIButtonTypeCustom];
        headButton.frame = CGRectMake(28/2, 50/2, 140/2, 140/2);
        [headButton addTarget:self action:@selector(headClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headButton setImage:[UIImage imageNamed:@"default_head_portrait"] forState:UIControlStateNormal];
        [_headContentView addSubview:headButton];
        
        UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(headButton.right+24/2, 84/2, self.view.width - headButton.right+24/2, 38/2)];
        userNameLabel.text = @"尚未登录";
        userNameLabel.textColor = [UIColor whiteColor];
        userNameLabel.font = [UIFont systemFontOfSize:18];
        [_headContentView addSubview:userNameLabel];
        
        UILabel *userStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(headButton.right+24/2, userNameLabel.bottom+30/2, self.view.width - headButton.right+24/2, 38/2)];
        userStateLabel.text = @"尚未登录";
        userStateLabel.textColor = [UIColor whiteColor];
        userStateLabel.font = [UIFont systemFontOfSize:15];
        [_headContentView addSubview:userStateLabel];
    }
    return _headContentView;
}

#pragma mark - Custom Method
- (void)headClicked:(UIButton *)sender{
    DLog(@"headClicked:");
}

- (void)logoutClicked:(UIButton *)sender{
    DLog(@"logoutClicked:");
}

- (void)buttonClicked:(UIButton *)sender{
    DLog(@"buttonClicked:%ld", sender.tag);
}

@end
