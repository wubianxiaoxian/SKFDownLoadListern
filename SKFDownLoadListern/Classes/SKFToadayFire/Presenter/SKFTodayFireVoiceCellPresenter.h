//
//  SKFTodayFireVoiceCellPresenter.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKFDownLoadVoiceModel.h"
#import "SKFTodayFireVoiceCell.h"
@interface SKFTodayFireVoiceCellPresenter : NSObject
@property (nonatomic, strong) SKFDownLoadVoiceModel *voiceM;

@property (nonatomic, assign) NSInteger sortNum;

- (void)bindWithCell: (SKFTodayFireVoiceCell *)cell;
@end
