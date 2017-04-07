//
//  SKFDownLoadListernDataTool.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "SKFSqliteModelTool.h"

#import "SKFDownLoadListernDataTool.h"

@implementation SKFDownLoadListernDataTool
+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadingVoiceMs {
    
    return [SKFSqliteModelTool queryModels:[SKFDownLoadVoiceModel class]  key:@"isDownLoaded" relation:SKFSqliteModelToolRelationTypeEqual value:@(NO) uid:nil];
    
}

+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadedVoiceMs {
    return [SKFSqliteModelTool queryModels:[SKFDownLoadVoiceModel class]  key:@"isDownLoaded" relation:SKFSqliteModelToolRelationTypeEqual value:@(YES) uid:nil];
}

+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadedVoiceMsInAlbumID: (NSInteger)albumID {
    
    return [SKFSqliteModelTool queryModels:[SKFDownLoadVoiceModel class] keys:@[@"isDownLoaded", @"albumID"] relations:@[@(SKFSqliteModelToolRelationTypeEqual), @(SKFSqliteModelToolRelationTypeEqual)] values:@[@"1", @(albumID)] nao:@[@(SKFSqliteModelToolNAOAnd)] uid:nil];
    
}

+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadedAlbums {
    
    NSArray *array = [SKFSqliteModelTool queryModels:[SKFAlbumModel class] sql:@"select albumId, albumTitle, commentsCounts, coverSmall as albumCoverMiddle,nickName as authorName, count(*) as voiceCount, sum(totalSize) as allVoiceSize from SKFDownLoadVoiceModel where isDownLoaded = '1' group by albumId" uid:nil];
    
    return array;
}

@end
