//
//
//  SKFTodayFireMainVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SKFDownLoadVoiceModel : NSObject



/** -----------------专辑相关信息------------------- */
/**
 专辑ID
 */
@property (nonatomic, assign) NSInteger albumId;

/**
 专辑名称
 */
@property (nonatomic, copy) NSString *albumTitle;

/**
 评论个数
 */
@property (nonatomic, assign) NSInteger commentsCounts;
/**
 专辑图片
 */
@property (nonatomic, copy) NSString *albumCoverMiddle;


/** -----------------声音相关信息------------------- */


/**
 声音ID
 */
@property (nonatomic, assign) NSInteger trackId;
/**
 标题
 */
@property (nonatomic, copy) NSString *title;
/**
 播放URL
 */
@property (nonatomic, copy) NSString *playPathAacv164;

/**
 播放次数
 */
@property (nonatomic, assign) NSInteger playtimes;

/**
 作者昵称
 */
@property (nonatomic, copy) NSString *nickname;
/**
 覆盖图片(小)
 */
@property (nonatomic, copy) NSString *coverSmall;
/**
 播放总时长
 */
@property (nonatomic, assign) NSInteger duration;

/**
 喜欢的个数
 */
@property (nonatomic, assign) NSInteger favoritesCounts;


@property (nonatomic, assign) NSInteger sortNum;

/** 是否已经被下载 */
@property (nonatomic, assign) BOOL isDownLoaded;

/** 文件总大小 */
@property (nonatomic, assign) long long totalSize;

@end
