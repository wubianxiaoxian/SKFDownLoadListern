//
//  SKFTodayFireMainVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import <Foundation/Foundation.h>

// 瘦模型
// 胖模型
// 弱业务逻辑 // 数据加载的代码
@interface SKFCategoryModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
// 04:59
// 123213
@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic, readonly) NSString *timeFormat;
@end
