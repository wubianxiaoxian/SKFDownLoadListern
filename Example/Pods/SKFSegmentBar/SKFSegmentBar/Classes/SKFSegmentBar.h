//
//  SKFSegmentBar.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/3/31.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKFSegmentBarConfig.h"

@class SKFSegmentBar;
@protocol SKFSegmentBarDelegate <NSObject>

/**
 代理方法, 告诉外界, 内部的点击数据
 
 @param segmentBar segmentBar
 @param toIndex    选中的索引(从0开始)
 @param fromIndex  上一个索引
 */
- (void)segmentBar: (SKFSegmentBar *)segmentBar didSelectIndex: (NSInteger)toIndex fromIndex: (NSInteger)fromIndex;

@end
@interface SKFSegmentBar : UIView
/**
 快速创建一个选项卡控件
 
 @param frame frame
 
 @return 选项卡控件
 */
+ (instancetype)segmentBarWithFrame: (CGRect)frame;
/** 代理 */
@property (nonatomic, weak) id<SKFSegmentBarDelegate> delegate;
/** 数据源 */
@property (nonatomic, strong) NSArray <NSString *>*items;
/** 当前选中的索引, 双向设置 */
@property (nonatomic, assign) NSInteger selectIndex;

- (void)updateWithConfig: (void(^)(SKFSegmentBarConfig *config))configBlock;
@end
