//
//  SKFTodayFireMainVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SKFDownLoadVoiceModel.h"


typedef NS_ENUM(NSUInteger, SKFTodayFireVoiceCellState) {
    SKFTodayFireVoiceCellStateWaitDownLoad,
    SKFTodayFireVoiceCellStateDownLoading,
    SKFTodayFireVoiceCellStateDownLoaded,
};

@interface SKFTodayFireVoiceCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SKFDownLoadVoiceModel *voiceM;

/** 声音标题 */
@property (weak, nonatomic) IBOutlet UILabel *voiceTitleLabel;
/** 声音作者 */
@property (weak, nonatomic) IBOutlet UILabel *voiceAuthorLabel;
/** 声音播放暂停按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playOrPauseBtn;
/** 声音排名标签 */
@property (weak, nonatomic) IBOutlet UILabel *sortNumLabel;
/** 声音下载按钮 */
@property (weak, nonatomic) IBOutlet UIButton *downLoadBtn;


@property (nonatomic, assign) SKFTodayFireVoiceCellState state;

@property (nonatomic, copy) void(^playBlock)(BOOL isPlay);
@property (nonatomic, copy) void(^downLoadBlock)();


@end
