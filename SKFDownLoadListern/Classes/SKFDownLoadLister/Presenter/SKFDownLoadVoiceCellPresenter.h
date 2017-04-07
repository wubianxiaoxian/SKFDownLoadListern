//
//  SKFDownLoadVoiceCellPresenter.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKFDownLoadVoiceModel.h"
#import "SKFDownLoadVoiceCell.h"
@interface SKFDownLoadVoiceCellPresenter : NSObject

// 原始数据
@property (nonatomic, strong) SKFDownLoadVoiceModel *voiceM;



- (void)bindWithCell: (SKFDownLoadVoiceCell *)cell;

@end
