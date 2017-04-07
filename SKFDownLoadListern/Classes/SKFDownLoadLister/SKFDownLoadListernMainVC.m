//
//  SKFDownLoadListernMainVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#import "SKFDownLoadAlbumTVC.h"
#import "SKFDownLoadingVoiceTVC.h"
#import "SKFDownLoadVoiceTVC.h"
#import "SKFDownLoadListernMainVC.h"
#import "SKFSementBarVC.h"
@interface SKFDownLoadListernMainVC ()
@property (nonatomic, weak) SKFSementBarVC *segmentBarVC;

@end

@implementation SKFDownLoadListernMainVC


- (SKFSementBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        SKFSementBarVC *segmentBarVC = [[SKFSementBarVC alloc] init];
        [self addChildViewController:segmentBarVC];
        _segmentBarVC = segmentBarVC;
    }
    return _segmentBarVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, 300, 40);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    
    self.segmentBarVC.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60);
    [self.view addSubview:self.segmentBarVC.view];
    
    SKFDownLoadAlbumTVC *vc1 = [[SKFDownLoadAlbumTVC alloc] init];
    vc1.view.backgroundColor = [UIColor brownColor];
    SKFDownLoadVoiceTVC *vc2 = [[SKFDownLoadVoiceTVC alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    SKFDownLoadingVoiceTVC *vc3 = [[SKFDownLoadingVoiceTVC alloc] init];
    vc3.view.backgroundColor = [UIColor cyanColor];
    [self.segmentBarVC setUpWithItems:@[@"专辑", @"声音", @"下载中"] childVCs:@[vc1, vc2, vc3]];
    
    [self.segmentBarVC.segmentBar updateWithConfig:^(SKFSegmentBarConfig *config) {
        config.segmentBarBackColor = [UIColor whiteColor];
    }];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];

    // Do any additional setup after loading the view.
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
