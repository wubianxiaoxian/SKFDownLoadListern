//
//  SKFModelTool.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKFSqliteTool : NSObject

// 关注
// 存储的时候, 直接, 联通, 用户ID, 存储到表里面  common
// 直接根据用户的id, 创建不同的数据库  common.db
// 张三.db lisi.db
// 空间

+ (BOOL)dealSql: (NSString *)sql withUID: (NSString *)uid;

+ (BOOL)dealSqls: (NSArray <NSString *>*)sqls withUID: (NSString *)uid;

+ (NSArray <NSDictionary *>*)querySql: (NSString *)sql withUID: (NSString *)uid;


@end
