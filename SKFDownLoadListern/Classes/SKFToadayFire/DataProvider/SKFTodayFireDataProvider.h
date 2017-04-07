//
//  SKFTodayFireDataProvider.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "SKFCategoryModel.h"
#import "SKFDownLoadVoiceModel.h"
#import <Foundation/Foundation.h>

@interface SKFTodayFireDataProvider : NSObject
+ (instancetype)shareInstance;
-(void)getToadyFireCategoryMs:(void(^)(NSArray<SKFCategoryModel *>*categoryMs))resultBlock;

-(void)getTodayFireVoiceMsWithKey:(NSString *)key result:(void(^)(NSArray<SKFDownLoadVoiceModel*>*voiceMs)) resultBlock;

@end
