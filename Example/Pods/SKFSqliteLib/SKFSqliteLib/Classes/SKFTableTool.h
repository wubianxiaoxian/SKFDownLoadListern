//
//  SKFModelTool.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.

#import <Foundation/Foundation.h>

@interface SKFTableTool : NSObject

/** 判断表格是否存在 */
+ (BOOL)isTableExists: (NSString *)tableName uid: (NSString *)uid;

/** 获取表格里面所有的字段 */
+ (NSArray *)getTableAllColumnNames: (NSString *)tableName uid: (NSString *)uid;

@end
