//
//  SKFTodayFireVoiceListTVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#define kBaseUrl @"http://mobile.ximalaya.com/"

#import "SKFTodayFireVoiceListTVC.h"
// 数据的提供者(数据模型)
#import "SKFTodayFireDataProvider.h"

// 数据模型如何具体展示在视图上
#import "SKFTodayFireVoiceCellPresenter.h"



#import "SKFTodayFireVoiceCell.h"
@interface SKFTodayFireVoiceListTVC ()
@property (nonatomic, strong) NSArray<SKFTodayFireVoiceCellPresenter *> *presenterMs;

@end

@implementation SKFTodayFireVoiceListTVC

-(void)setPresenterMs:(NSArray<SKFTodayFireVoiceCellPresenter *> *)presenterMs{
    _presenterMs = presenterMs;
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;

    __weak typeof(self) weakSelf = self;
    [[SKFTodayFireDataProvider shareInstance] getTodayFireVoiceMsWithKey:self.loadKey result:^(NSArray<SKFDownLoadVoiceModel *> *voiceMs) {
        
        NSMutableArray *presenters = [NSMutableArray array];
        for (SKFDownLoadVoiceModel *voiceM in voiceMs) {
            SKFTodayFireVoiceCellPresenter *presenter = [[SKFTodayFireVoiceCellPresenter alloc] init];
            presenter.voiceM = voiceM;
            [presenters addObject:presenter];
        }
        
        weakSelf.presenterMs = presenters;
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.presenterMs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKFTodayFireVoiceCell *cell=[SKFTodayFireVoiceCell cellWithTableView:tableView];
    SKFTodayFireVoiceCellPresenter *presenter = self.presenterMs[indexPath.row];

    presenter.sortNum = indexPath.row + 1;
    [presenter bindWithCell:cell];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SKFTodayFireVoiceCellPresenter *presenter = self.presenterMs[indexPath.row];
    
    NSLog(@"跳转到播放器界面进行播放--%@--", presenter.voiceM.title);
    
}


@end
