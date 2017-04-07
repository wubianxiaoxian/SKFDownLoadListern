//
//  SKFModelTool.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SKFSqliteModelToolRelationTypeEqual,
    SKFSqliteModelToolRelationTypeGreater,
    SKFSqliteModelToolRelationTypeLess,
    SKFSqliteModelToolRelationTypeEG,
    SKFSqliteModelToolRelationTypeEL,
    SKFSqliteModelToolRelationTypeNE,
} SKFSqliteModelToolRelationType;


typedef enum : NSUInteger {
    SKFSqliteModelToolNAONot,
    SKFSqliteModelToolNAOAnd,
    SKFSqliteModelToolNAOOr,
} SKFSqliteModelToolNAO;




@interface SKFSqliteModelTool : NSObject

// runtime 获取更多的信息, 让用户, 尽可能少的, 给我们提供信息
+ (BOOL)createTableWithModelClass: (Class)cls withUID: (NSString *)uid;


// 保存/ 已经存在, 更新
+ (BOOL)saveModel: (id)model uid: (NSString *)uid;

+ (NSArray *)queryAllModels:(Class)cls uid: (NSString *)uid;
+ (NSArray *)queryModels:(Class)cls key: (NSString *)key relation: (SKFSqliteModelToolRelationType)relation value: (id)value uid: (NSString *)uid;
+ (NSArray *)queryModels:(Class)cls keys: (NSArray *)keys relations: (NSArray *)relations values: (NSArray *)values nao: (NSArray *)naos uid: (NSString *)uid;
+ (NSArray *)queryModels:(Class)cls sql: (NSString *)sql uid: (NSString *)uid;


+ (BOOL)deleteModel: (id)model uid: (NSString *)uid;
+ (BOOL)deleteModel:(Class)cls key: (NSString *)key relation: (SKFSqliteModelToolRelationType)relation value: (id)value uid: (NSString *)uid;
+ (BOOL)deleteModel:(Class)cls keys: (NSArray *)keys relations: (NSArray *)relations values: (NSArray *)values nao: (NSArray *)naos uid: (NSString *)uid;
+ (BOOL)deleteWithSql: (NSString *)sql uid: (NSString *)uid;



@end
