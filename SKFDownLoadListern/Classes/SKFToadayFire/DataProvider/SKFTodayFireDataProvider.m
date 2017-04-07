//
//  SKFTodayFireDataProvider.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#define kBaseUrl @"http://mobile.ximalaya.com/"

#import "SKFSessionManager.h"
#import "MJExtension.h"
#import "SKFTodayFireDataProvider.h"
@interface SKFTodayFireDataProvider()
@property (nonatomic, strong) SKFSessionManager *sessionManager;

@end
@implementation SKFTodayFireDataProvider
static SKFTodayFireDataProvider *_shareInstance;

+ (instancetype)shareInstance{
    if (!_shareInstance) {
        _shareInstance=[[self alloc]init];
        
    }
    return _shareInstance;
}
- (SKFSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[SKFSessionManager alloc] init];
    }
    return _sessionManager;
}
-(void)getToadyFireCategoryMs:(void(^)(NSArray<SKFCategoryModel *>*categoryMs))resultBlock{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": @"ranking:track:scoreByTime:1:0",
                            @"pageId": @"1",
                            @"pageSize": @"0"
                            };
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        SKFCategoryModel *categoryM = [[SKFCategoryModel alloc] init];
        categoryM.key = @"ranking:track:scoreByTime:1:0";
        categoryM.name = @"总榜";
        
        NSMutableArray <SKFCategoryModel *>*categoryMs = [SKFCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"categories"]];
        if (categoryMs.count > 0) {
            [categoryMs insertObject:categoryM atIndex:0];
        }
        
        
        resultBlock(categoryMs);
        
    }];
    
}
-(void)getTodayFireVoiceMsWithKey:(NSString *)key result:(void(^)(NSArray<SKFDownLoadVoiceModel*>*voiceMs)) resultBlock{
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"mobile/discovery/v2/rankingList/track"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"key": key,
                            @"pageId": @"1",
                            @"pageSize": @"30"
                            };
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        
        NSMutableArray <SKFDownLoadVoiceModel *>*voiceyMs = [SKFDownLoadVoiceModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        resultBlock(voiceyMs);
        
    }];
}
@end
