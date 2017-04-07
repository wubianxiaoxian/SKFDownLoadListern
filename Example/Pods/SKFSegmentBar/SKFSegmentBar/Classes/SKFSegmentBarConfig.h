//
//  SKFSegmentBarConfig.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/3/31.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKFSegmentBarConfig : NSObject
+ (instancetype)defaultConfig;

/** 背景颜色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;

@property (nonatomic, strong) UIColor *itemNormalColor;
@property (nonatomic, strong) UIColor *itemSelectColor;
@property (nonatomic, strong) UIFont *itemFont;

@property (nonatomic, strong) UIColor *indicatorColor;

@property (nonatomic, assign) CGFloat indicatorHeight;
@property (nonatomic, assign) CGFloat indicatorExtraW;

// 内部实现, 在这个里面写, 外界, 只负责调用
// 功能, 改变 itemNormalColor 的值
//
@property (nonatomic, copy, readonly) SKFSegmentBarConfig *(^itemNC)(UIColor *color);
@property (nonatomic, copy, readonly) SKFSegmentBarConfig *(^itemSC)(UIColor *color);
@property (nonatomic, copy, readonly) SKFSegmentBarConfig *(^indicatorEW)(CGFloat w);
@end
