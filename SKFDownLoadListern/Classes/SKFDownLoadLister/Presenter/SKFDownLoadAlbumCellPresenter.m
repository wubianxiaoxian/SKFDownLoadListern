//
//  SKFDownLoadAlbumCellPresenter.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "SKFSqliteModelTool.h"
#import "SKFDownLoadedVoicInAlbumTVC.h"
#import "UIView+SKFNib.h"
#import "SKFDownLoadVoiceModel.h"
#import "SKFDownLoader.h"
#import "SKFDownLoadAlbumCellPresenter.h"

@implementation SKFDownLoadAlbumCellPresenter
- (NSURL *)imageURL {
    return [NSURL URLWithString:self.albumModel.albumCoverMiddle];
}

- (NSString *)title {
    return self.albumModel.albumTitle;
}

- (NSString *)author {
    return self.albumModel.authorName;
}

- (NSString *)voiceCount {
    return [NSString stringWithFormat:@"%zd", self.albumModel.voiceCount];
}

- (NSString *)getFormatSizeWithSize: (long long)fileSize
{
    NSArray *unit = @[@"B", @"kb", @"M", @"G"];
    
    double tmpSize = fileSize;
    int index = 0;
    while (tmpSize > 1024) {
        tmpSize /= 1024;
        index ++;
    }
    return [NSString stringWithFormat:@"%.1f%@",tmpSize, unit[index]];
}

- (NSString *)totalSize {
    return [self getFormatSizeWithSize:self.albumModel.allVoiceSize];
}

- (void)bindWithCell: (SKFDownLoadAlbumCell *)cell {
    
    /** 专辑图片 */
    [cell.albumImageView sd_setImageWithURL:[self imageURL]];
    /** 专辑标题 */
    cell.albumTitleLabel.text = [self title];
    /** 专辑作者 */
    cell.albumAuthorLabel.text = [self author];
    /** 专辑集数 */
    [cell.albumPartsBtn setTitle:[self voiceCount] forState:UIControlStateNormal];
    /** 专辑大小 */
    [cell.albumPartsSizeBtn setTitle:[self totalSize] forState:UIControlStateNormal];
    
    /** 删除按钮点击执行代码块 */
    [cell setDeleteBlock:^{
        
        // 删除资源
        
        
        NSArray *voiceMs = [SKFSqliteModelTool queryModels:NSClassFromString(@"SKFDownLoadVoiceModel") keys:@[@"albumId", @"isDownLoaded"] relations:@[@(SKFSqliteModelToolRelationTypeEqual), @(SKFSqliteModelToolRelationTypeEqual)] values:@[@(self.albumModel.albumId), @(YES)] nao:@[@(SKFSqliteModelToolNAOAnd)] uid:nil];
        
        for (SKFDownLoadVoiceModel *voiceM in voiceMs) {
            [SKFDownLoader clearCacheWithURL:[NSURL URLWithString:voiceM.playPathAacv164]];
        }
        
        [SKFSqliteModelTool deleteModel:NSClassFromString(@"SKFDownLoadVoiceModel") key:@"albumId" relation:SKFSqliteModelToolRelationTypeEqual value:@(self.albumModel.albumId) uid:nil];
        
        // 发送通知, 刷新表格
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadCache" object:nil];
    }];
    
    /** 选中执行代码块 */
    __weak typeof(cell) weakCell = cell;
    __weak typeof(self) weakSelf = self;
    [cell setSelectBlock:^{
        SKFDownLoadedVoicInAlbumTVC *vc = [SKFDownLoadedVoicInAlbumTVC new];
        vc.albumID = self.albumModel.albumId;
        vc.navigationItem.title = weakSelf.albumModel.albumTitle;
        [weakCell.currentViewController.navigationController pushViewController:vc animated:YES];
    }];
    
}




@end
