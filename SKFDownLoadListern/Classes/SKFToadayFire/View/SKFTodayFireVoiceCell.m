//
//  SKFTodayFireMainVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "SKFRemotePlayer.h"
#import "SKFTodayFireVoiceCell.h"
#import "UIButton+WebCache.h"
#import "SKFDownLoadManager.h"
@interface SKFTodayFireVoiceCell ()


@end


@implementation SKFTodayFireVoiceCell


static NSString *const cellID = @"todayFireVoice";

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    SKFTodayFireVoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
        cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"SKFTodayFireVoiceCell" owner:nil options:nil] firstObject];
        [cell addObserver:cell forKeyPath:@"sortNumLabel.text" options:NSKeyValueObservingOptionNew context:nil];
    }

    return cell;
}

#pragma mark - 下载功能集成

/**
 当用户点击下载按钮时, 触发的动作, 注意判断按钮当前状态
 */

- (IBAction)downLoad {
    if (self.state == SKFTodayFireVoiceCellStateWaitDownLoad) {
        NSLog(@"下载");
        if (self.downLoadBlock) {
            self.downLoadBlock();
        }

    }
}

#pragma mark - 集成播放功能

- (IBAction)playOrPause:(UIButton *)sender {
    sender.selected = !sender.selected;

    NSLog(@"播放/暂停");
    if (self.playBlock) {
        self.playBlock(sender.selected);
    }

}

- (void)setState:(SKFTodayFireVoiceCellState)state {

    _state = state;
    switch (state) {
        case SKFTodayFireVoiceCellStateWaitDownLoad:
            NSLog(@"等待下载");
            [self removeRotationAnimation];
            [self.downLoadBtn setImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
            break;
        case SKFTodayFireVoiceCellStateDownLoading:
        {
            NSLog(@"正在下载");
             [self.downLoadBtn setImage:[UIImage imageNamed:@"cell_download_loading"] forState:UIControlStateNormal];
            [self addRotationAnimation];
            break;
        }
        case SKFTodayFireVoiceCellStateDownLoaded:
            NSLog(@"下载完毕");
            [self removeRotationAnimation];
            [self.downLoadBtn setImage:[UIImage imageNamed:@"cell_downloaded"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }

}

- (void)setVoiceM:(SKFDownLoadVoiceModel *)voiceM {
    _voiceM = voiceM;

    self.voiceTitleLabel.text = voiceM.title;
    self.voiceAuthorLabel.text = [NSString stringWithFormat:@"by %@", voiceM.nickname];

    [self.playOrPauseBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:voiceM.coverSmall]  forState:UIControlStateNormal];
    self.sortNumLabel.text = [NSString stringWithFormat:@"%zd", voiceM.sortNum];
    
    // 一定要注意动态的获取下载状态
    // 因为cell重用, 所以必须准确的获取url对应的下载状态
    NSURL *url = [NSURL URLWithString:self.voiceM.playPathAacv164];
    SKFDownLoader *downLoader = [[SKFDownLoadManager shareInstance] getDownLoaderWithURL:url];
    SKFDownLoaderState state = downLoader.state;
    
    
    if (state == SKFDownLoaderStateDowning) {
        self.state = SKFTodayFireVoiceCellStateDownLoading;
    }else if(state == SKFDownLoaderStateSuccess || [SKFDownLoader downLoadedFileWithURL:url].length > 0)
    {
        self.state = SKFTodayFireVoiceCellStateDownLoaded;
    }else {
        self.state = SKFTodayFireVoiceCellStateWaitDownLoad;
    }
    



}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
}

- (void)addRotationAnimation {
    [self removeRotationAnimation];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2.0);
    animation.duration = 10;
    animation.removedOnCompletion = NO;
    animation.repeatCount = MAXFLOAT;
    [self.downLoadBtn.imageView.layer addAnimation:animation forKey:@"rotation"];

}

- (void)removeRotationAnimation {

    [self.downLoadBtn.imageView.layer removeAllAnimations];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];

    self.playOrPauseBtn.layer.masksToBounds = YES;
    self.playOrPauseBtn.layer.borderWidth = 3;
    self.playOrPauseBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.playOrPauseBtn.layer.cornerRadius = 20;


}

-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"sortNumLabel.text"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"sortNumLabel.text"]) {
        NSInteger sort = [change[NSKeyValueChangeNewKey] integerValue];
        if (sort == 1) {
            self.sortNumLabel.textColor = [UIColor redColor];
        }else if (sort == 2) {
            self.sortNumLabel.textColor = [UIColor orangeColor];
        }else if (sort == 3) {
            self.sortNumLabel.textColor = [UIColor greenColor];
        }else {
            self.sortNumLabel.textColor = [UIColor grayColor];
        }
        return;
    }

}
@end
