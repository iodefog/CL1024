//
// Created by Eugene on 23.05.15.
// Copyright (c) 2015 bicyclefabric. All rights reserved.
//

@import UIKit;

@interface UIView (BFAdditions)

//frame.origin.x
@property(nonatomic) CGFloat left;

//Sets frame.origin.y
@property(nonatomic) CGFloat top;

//frame.origin.x + frame.size.width
@property(nonatomic) CGFloat right;

//frame.origin.y + frame.size.height
@property(nonatomic) CGFloat bottom;

//frame.size.width
@property(nonatomic) CGFloat width;

//frame.size.width / 2
@property(nonatomic, readonly) CGFloat halfWidth;

//frame.size.height
@property(nonatomic) CGFloat height;

//frame.size.height / 2
@property(nonatomic, readonly) CGFloat halfHeight;

//center.x
@property(nonatomic) CGFloat centerX;

//center.y
@property(nonatomic) CGFloat centerY;

@end