//
//  SKFDownLoadedVoicInAlbumTVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import "SKFDownLoadedVoicInAlbumTVC.h"

#import "SKFDownLoadListernDataTool.h"
#import "SKFDownLoadVoiceCellPresenter.h"
#import "SKFDownLoadVoiceCell.h"

@interface SKFDownLoadedVoicInAlbumTVC ()

@end

@implementation SKFDownLoadedVoicInAlbumTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCache];
}
- (void)reloadCache {
    
    NSArray <SKFDownLoadVoiceModel *>*downLoadingMs = [SKFDownLoadListernDataTool getDownLoadedVoiceMsInAlbumID:self.albumID];
    NSMutableArray <SKFDownLoadVoiceCellPresenter *>*downLoadingPresenters = [NSMutableArray arrayWithCapacity:downLoadingMs.count];
    for (SKFDownLoadVoiceModel *downLoadingM in downLoadingMs) {
        SKFDownLoadVoiceCellPresenter *presenter = [SKFDownLoadVoiceCellPresenter new];
        presenter.voiceM = downLoadingM;
        [downLoadingPresenters addObject:presenter];
    }
    
    
    [self setUpWithDataSouce:downLoadingPresenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [SKFDownLoadVoiceCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 80;
    } bind:^(SKFDownLoadVoiceCell *cell, SKFDownLoadVoiceCellPresenter *model) {
        [model bindWithCell:cell];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
