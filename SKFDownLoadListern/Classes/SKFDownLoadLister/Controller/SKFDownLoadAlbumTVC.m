//
//  SKFDownLoadAlbumTVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "SKFDownLoadListernDataTool.h"
#import "SKFDownLoadAlbumCellPresenter.h"
#import "SKFDownLoadAlbumCell.h"

#import "SKFDownLoadAlbumTVC.h"

@interface SKFDownLoadAlbumTVC ()

@end

@implementation SKFDownLoadAlbumTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadCache];
}
- (void)reloadCache {
    
    NSArray <SKFAlbumModel *>*albumMs = [SKFDownLoadListernDataTool getDownLoadedAlbums];
    NSMutableArray <SKFDownLoadAlbumCellPresenter *>*presenters = [NSMutableArray arrayWithCapacity:albumMs.count];
    for (SKFAlbumModel *albumM in albumMs) {
        SKFDownLoadAlbumCellPresenter *presenter = [SKFDownLoadAlbumCellPresenter new];
        presenter.albumModel = albumM;
        [presenters addObject:presenter];
    }
    
    
    
    [self setUpWithDataSouce:presenters getCell:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        return [SKFDownLoadAlbumCell cellWithTableView:tableView];
    } cellHeight:^CGFloat(id model) {
        return 80;
    } bind:^(SKFDownLoadAlbumCell *cell, SKFDownLoadAlbumCellPresenter *model) {
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
