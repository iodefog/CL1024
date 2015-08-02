//
//  CLBottomView.m
//  CL1024
//
//  Created by LiHongli on 15/7/30.
//  Copyright (c) 2015年 com.lhl.cl. All rights reserved.
//

#import "CLBottomView.h"
#import "PopoverView.h"
#import "CLPageTableView.h"

@interface CLBottomView()<PopoverViewDelegate>

@property (nonatomic, strong) UIButton      *selectFieldButton;
@property (nonatomic, strong) UIButton      *seeCacheButton;
@property (nonatomic, strong) UIButton      *reloadFirstButton;
@property (nonatomic, strong) UIButton      *prePageButton;
@property (nonatomic, strong) UIButton      *selectPageField;
@property (nonatomic, strong) UIButton      *behindPageButton;

@property (nonatomic, strong) PopoverView   *selectedFieldPopoverView;
@property (nonatomic, strong) PopoverView   *pagesPopoverView;
@property (nonatomic, strong) CLPageTableView   *fieldTableView;
@property (nonatomic, strong) CLPageTableView   *pageTableView;
@property (nonatomic, strong) NSArray       *selectedFieldArray;
@property (nonatomic, strong) NSMutableArray*pagesArray;

@end;

@implementation CLBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = UIColorFromRGB(0xf9faec);
        [self instancedData];
        [self createUI];
    }
    return self;
}

- (void)instancedData{
    self.pageCurrentIndex = 1;
    self.pageCount = -1;
    self.selectedFieldArray = @[@"浏览全部帖子",
                                @"只看精华帖子",
                                @"一天内的帖子",
                                @"一周内的帖子",
                                @"一月内的帖子",
                                @"一年内的帖子"];
    
    self.pagesArray = [NSMutableArray array];
    for (int i = 0; i < 200; i ++) {
        NSString *title = [NSString stringWithFormat:@"查看第%@页",@(i)];
        if (i == 0) {
            title = @"当前页";
        }
        [self.pagesArray addObject:title];
    }
}

- (void)createUI{
    
    UIView *sperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 1)];
    sperateLine.backgroundColor = UIColorFromRGB(0x16656c);
    [self addSubview:sperateLine];
    [self addSubview:self.selectFieldButton];
    [self addSubview:self.seeCacheButton];
    [self addSubview:self.reloadFirstButton];
    [self addSubview:self.prePageButton];
    [self addSubview:self.selectPageField];
    [self addSubview:self.behindPageButton];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width/7;
    self.selectFieldButton.left = 10;
    self.seeCacheButton.left = 10+width;
    self.reloadFirstButton.left = 10+ 2*width;
    self.prePageButton.left = 20+3*width;
    self.prePageButton.width = 20;
    self.selectPageField.left = 10+4*width;
    self.behindPageButton.left = 20+6*width;
    self.behindPageButton.width = 20;
}
#pragma mark - Custom Method

- (void)buttonClicked:(UIButton *)sender{
    switch (sender.tag) {
        case 1000:
        {
            CGPoint point = CGPointMake(sender.width/2, sender.top);
            if (!self.fieldTableView) {
                self.fieldTableView = [[CLPageTableView alloc] initWithFrame:CGRectMake(0, 0, 120, 250)style:UITableViewStylePlain];
                self.fieldTableView.pagesArray = (id)self.selectedFieldArray;
                 __block typeof(self) mySelf = self;
                self.fieldTableView.pageTableBlock = ^(NSIndexPath *indexPath){
                    if(mySelf.bottomBlock)
                    mySelf.bottomBlock(indexPath.row, CLSelectField);
                    [mySelf.selectedFieldPopoverView dismiss:YES];
                };
            }
            self.selectedFieldPopoverView =
            [PopoverView showPopoverAtPoint:point inView:sender withContentView:self.fieldTableView delegate:self];
            break;
        }
        case 1001:
        {
            if(self.bottomBlock)
            self.bottomBlock(1, CLSeeCache);
            break;
        }
        case 1002:
        {
            if(self.bottomBlock)
            self.bottomBlock(self.pageCurrentIndex, CLReloadFirst);
            break;
        }
        case 1003:
        {
            if (self.pageCurrentIndex>=2) {
                self.pageCurrentIndex -- ;
                if(self.bottomBlock)
                    self.bottomBlock(self.pageCurrentIndex, CLSelectPage);
            }
            break;
        }
        case 1004:
        {
            if(self.pageCurrentIndex < self.pageCount){
                self.pageCurrentIndex ++ ;
                if(self.bottomBlock)
                self.bottomBlock(self.pageCurrentIndex, CLSelectPage);
            }
            break;
        }
        case 1005:
        {
            CGPoint point = CGPointMake(sender.width/2, sender.top-17);
            if (!self.pageTableView) {
                self.pageTableView = [[CLPageTableView alloc] initWithFrame:CGRectMake(0, 0, 110, 250)style:UITableViewStylePlain];
                self.pageTableView.pagesArray = self.pagesArray;
                __block typeof(self) mySelf = self;
                self.pageTableView.pageTableBlock = ^(NSIndexPath *indexPath){
                    mySelf.pageCurrentIndex = indexPath.row+1;
                    if(mySelf.bottomBlock)
                    mySelf.bottomBlock(mySelf.pageCurrentIndex, CLSelectPage);
                    [mySelf.selectedFieldPopoverView dismiss:YES];
                };
            }
            self.selectedFieldPopoverView =
            [PopoverView showPopoverAtPoint:point inView:sender withContentView:self.pageTableView delegate:self];
            break;
        }
            
        default:
            break;
    }
}


#pragma mark -- create View

- (UIButton *)selectFieldButton{
    if (!_selectFieldButton) {
        _selectFieldButton = [self createButtonWithImage:@"p_post_filter" tag:1000];
    }
    return _selectFieldButton;
}

- (UIButton *)seeCacheButton{
    if (!_seeCacheButton) {
        _seeCacheButton = [self createButtonWithImage:@"p_post_switch" tag:1001];
    }
    return _seeCacheButton;
}

- (UIButton *)reloadFirstButton{
    if (!_reloadFirstButton) {
        _reloadFirstButton = [self createButtonWithImage:@"p_refresh" tag:1002];
    }
    return _reloadFirstButton;
}

- (UIButton *)prePageButton{
    if (!_prePageButton) {
        _prePageButton = [self createButtonWithImage:@"p_left_black_arrows" tag:1003];
    }
    return _prePageButton;
}

- (UIButton *)behindPageButton{
    if (!_behindPageButton) {
        _behindPageButton = [self createButtonWithImage:@"p_right_black_arrows" tag:1004];;
    }
    return _behindPageButton;
}

- (UIButton *)selectPageField{
    if (!_selectPageField) {
        _selectPageField = [self createButtonWithImage:@"" tag:1005];
        _selectPageField.frame = CGRectMake(0, 8, 90, 30);
        _selectPageField.layer.borderColor = UIColorFromRGB(0xafafaf).CGColor;
        _selectPageField.layer.cornerRadius = 3;
        _selectPageField.layer.borderWidth = 1.f;
        [_selectPageField setTitleColor:UIColorFromRGB(0xafafaf) forState:UIControlStateNormal];
        [_selectPageField setTitle:@"1/1" forState:UIControlStateNormal]; ;
    }
    return _selectPageField;
}


- (UIButton *)createButtonWithImage:(NSString *)image tag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = tag;
    button.frame = CGRectMake(0, 0, 45, 45);
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    return button;
}

- (void)setPageCurrentIndex:(NSInteger)pageCurrentIndex{
    _pageCurrentIndex = pageCurrentIndex;
    [self.selectPageField setTitle:[NSString stringWithFormat:@"%@/%@",@(_pageCurrentIndex),@(self.pageCount)] forState:UIControlStateNormal];
}

- (void)setPageCount:(NSInteger)pageCount{
    _pageCount = pageCount;
    [self.selectPageField setTitle:[NSString stringWithFormat:@"%@/%@",@(self.pageCurrentIndex),@(self.pageCount)] forState:UIControlStateNormal];
}

@end
