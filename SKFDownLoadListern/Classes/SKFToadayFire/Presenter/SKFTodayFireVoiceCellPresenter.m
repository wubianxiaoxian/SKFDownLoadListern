//
//  SKFTodayFireVoiceCellPresenter.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "UIButton+WebCache.h"
#import "SKFDownLoadManager.h"
#import "SKFRemotePlayer.h"

#import "SKFSqliteModelTool.h"
#import "SKFTodayFireVoiceCellPresenter.h"
@interface SKFTodayFireVoiceCellPresenter()
@property (nonatomic, weak) SKFTodayFireVoiceCell *cell;

@end
@implementation SKFTodayFireVoiceCellPresenter
- (NSString *)title {
    return self.voiceM.title;
}
- (NSString *)authorName {
    return [NSString stringWithFormat:@"by %@", self.voiceM.nickname];
}
- (NSURL *)voiceURL {
    return [NSURL URLWithString:self.voiceM.coverSmall];
}

- (NSString *)sortNumStr {
    return [NSString stringWithFormat:@"%zd", self.sortNum];
}

- (NSURL *)playOrDownLoadURL {
    return [NSURL URLWithString:self.voiceM.playPathAacv164];
}
- (SKFTodayFireVoiceCellState)cellDownLoadState {
    SKFDownLoader *downLoaer = [[SKFDownLoadManager shareInstance] getDownLoaderWithURL:[self playOrDownLoadURL]];
    if (downLoaer.state == SKFDownLoaderStateDowning) {
        return  SKFTodayFireVoiceCellStateDownLoading;
    }else if (downLoaer.state == SKFDownLoaderStateSuccess  || [SKFDownLoader downLoadedFileWithURL:[self playOrDownLoadURL]].length > 0) {
        return   SKFTodayFireVoiceCellStateDownLoaded;
    }else {
        return  SKFTodayFireVoiceCellStateWaitDownLoad;
    }
    
}
- (BOOL)isPlaying {
    if ([[self playOrDownLoadURL] isEqual:[SKFRemotePlayer shareInstance].url]) {
        SKFRemotePlayerState state = [SKFRemotePlayer shareInstance].state;
        if (state == SKFRemotePlayerStatePlaying || state == SKFRemotePlayerStateLoading) {
            return YES;
        }else {
            return NO;
        }
    }else {
        return NO;
    }
}
- (void)bindWithCell: (SKFTodayFireVoiceCell *)cell {
    
    self.cell = cell;
    
    cell.voiceTitleLabel.text = [self title];
    cell.voiceAuthorLabel.text = [self authorName];
    [cell.playOrPauseBtn sd_setBackgroundImageWithURL:[self voiceURL]  forState:UIControlStateNormal];
    cell.sortNumLabel.text = [self sortNumStr];
    
    // 动态计算下载状态
    cell.state = [self cellDownLoadState];
    // 动态计算播放状态
    cell.playOrPauseBtn.selected = [self isPlaying];
    
    
    // 事件处理
    [cell setPlayBlock:^(BOOL isPlay) {
        if (isPlay) {
            [[SKFRemotePlayer shareInstance] playWithURL:[self playOrDownLoadURL] isCache:NO];
        }else {
            [[SKFRemotePlayer shareInstance] pause];
        }
    }];
    
    __weak typeof(self) weakSelf = self;
    [cell setDownLoadBlock:^{
        __strong typeof(weakSelf.voiceM) strongVoiceM = weakSelf.voiceM;
        [[SKFDownLoadManager shareInstance] downLoadWithURL:[self playOrDownLoadURL] downLoadInfo:^(long long fileSize) {
            strongVoiceM.totalSize = fileSize;
            [SKFSqliteModelTool saveModel:strongVoiceM uid:nil];
        } success:^(NSString *cacheFilePath) {
            strongVoiceM.isDownLoaded = YES;
            [SKFSqliteModelTool saveModel:strongVoiceM uid:nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
        } failed:nil];
    }];
    
}
- (void)downLoadStateChange: (NSNotification *)notice {
    
    NSDictionary *dic = notice.userInfo;
    NSString *url = dic[@"downLoadURL"];
    if (![url isEqual:self.playOrDownLoadURL]) {
        return;
    }
    
    self.cell.state = [self cellDownLoadState];
}

- (void)playStateChange: (NSNotification *)notice {
    NSDictionary *noticeDic = notice.userInfo;
    NSURL *url = noticeDic[@"playURL"];
    
    if (![[self playOrDownLoadURL] isEqual:url]) {
        self.cell.playOrPauseBtn.selected = NO;
        return;
    }
    
    SKFRemotePlayerState state = [noticeDic[@"playState"] integerValue];
    if (state == SKFRemotePlayerStatePlaying || state == SKFRemotePlayerStateLoading) {
        self.cell.playOrPauseBtn.selected = YES;
    }else {
        self.cell.playOrPauseBtn.selected = NO;
    }
    
}
- (instancetype)init{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downLoadStateChange:) name:kDownLoadURLOrStateChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playStateChange:) name:kRemotePlayerURLOrStateChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"释放模型--%@", self.voiceM.title);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
