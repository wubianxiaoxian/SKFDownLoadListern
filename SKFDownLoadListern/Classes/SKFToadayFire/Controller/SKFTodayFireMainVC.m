//
//  SKFTodayFireMainVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//
#define kBaseUrl @"http://mobile.ximalaya.com/"

#import "SKFTodayFireMainVC.h"
#import "SKFSementBarVC.h"
#import "SKFTodayFireVoiceListTVC.h"


#import "SKFTodayFireDataProvider.h"
@interface SKFTodayFireMainVC ()
@property (nonatomic, weak) SKFSementBarVC *segContentVC;

@property (nonatomic, strong) NSArray<SKFCategoryModel *> *categoryMs;

@end

@implementation SKFTodayFireMainVC
#pragma mark - 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self loadData];
    // Do any additional setup after loading the view.
}
#pragma mark   ------------- 私有方法 --------------
-(void)setUpUI{
    self.title=@"今日最火";
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.segContentVC.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.segContentVC.view];
}
- (void)loadData{
    // 发送网络请求
    __weak typeof(self) weakSelf = self;
    [[SKFTodayFireDataProvider shareInstance] getToadyFireCategoryMs:^(NSArray<SKFCategoryModel *> *categoryMs) {
        weakSelf.categoryMs = categoryMs;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载,联动方法
- (SKFSementBarVC *)segContentVC {
    if (!_segContentVC) {
        SKFSementBarVC *contentVC = [[SKFSementBarVC alloc] init];
        [self addChildViewController:contentVC];
        _segContentVC = contentVC;
    }
    return _segContentVC;
}

- (void)setCategoryMs:(NSArray<SKFCategoryModel *> *)categoryMs {
    _categoryMs = categoryMs;
    
    NSInteger vcCount = _categoryMs.count;
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:vcCount];
    for (SKFCategoryModel *model in _categoryMs) {
        SKFTodayFireVoiceListTVC *vc = [[SKFTodayFireVoiceListTVC alloc] init];
        vc.loadKey = model.key;
        [vcs addObject:vc];
    }
    
    [self.segContentVC setUpWithItems:[categoryMs valueForKeyPath:@"name"] childVCs:vcs];
    
}


@end
