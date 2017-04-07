//
//  SKFDownLoadBaseTVC.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import "SKFDownLoadBaseTVC.h"
#import "SKFNoDownLoadView.h"
#import "SKFTodayFireMainVC.h"

@interface SKFDownLoadBaseTVC ()
@property (nonatomic, strong) NSArray *dataSources;
@property (nonatomic, weak) SKFNoDownLoadView *noDataLoadView;

@property (nonatomic, copy) GetCellBlock cellBlock;
@property (nonatomic, copy) GetHeightBlock heightBlock;
@property (nonatomic, copy) BindBlock bindBlock;


@end

@implementation SKFDownLoadBaseTVC

#pragma mark - 懒加载

- (SKFNoDownLoadView *)noDataLoadView {
    if (!_noDataLoadView) {
        SKFNoDownLoadView *noLoadView = [SKFNoDownLoadView noDownLoadView];
        [self.view addSubview:noLoadView];
        _noDataLoadView = noLoadView;
    }
    return _noDataLoadView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.noDataLoadView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.4);
    NSBundle *currentBundle=[NSBundle bundleForClass:[self class]];
    NSString *bundleName=currentBundle.infoDictionary[@"CFBundleName"];
    NSInteger scale_screen = [UIScreen mainScreen].scale;
    NSLog(@"scale_screen %ld",(long)scale_screen);
    if ([self isKindOfClass:NSClassFromString(@"SKFDownLoadingVoiceTVC")]) {
        NSString *path=[currentBundle pathForResource:[NSString stringWithFormat:@"noData_downloading@%ldx.png",(long)scale_screen] ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]];
        
        self.noDataLoadView.noDataImg = [UIImage imageWithContentsOfFile:path];;
    }else {
     NSString *path = [currentBundle pathForResource:@"noData_download.png" ofType:nil inDirectory:[NSString stringWithFormat:@"%@.bundle", bundleName]];
        self.noDataLoadView.noDataImg = [UIImage imageWithContentsOfFile:path];
    }
    
    [self.noDataLoadView setClickBlock:^{
                NSLog(@"去看看");
        SKFTodayFireMainVC *todayFire = [[SKFTodayFireMainVC alloc] init];
        [self.navigationController pushViewController:todayFire animated:YES];
    }];
    
    // 数据源
    // cell
    // 高度
    // bind

}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setUpWithDataSouce: (NSArray *)dataSource getCell: (GetCellBlock)cellBlock cellHeight: (GetHeightBlock)cellHeightBlock bind: (BindBlock)bindBlock
{
    
    self.dataSources = dataSource;
    self.cellBlock = cellBlock;
    self.heightBlock = cellHeightBlock;
    self.bindBlock = bindBlock;
    
    [self.tableView reloadData];
    
    
}


#pragma mark - UITableViewDataSource
#pragma mark  Sections个数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//}
#pragma mark   每组Section中Rows个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.noDataLoadView.hidden = self.dataSources.count != 0;
    return self.dataSources.count;
    
}
#pragma mark   填充cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = self.cellBlock(tableView, indexPath);
    
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.dataSources[indexPath.row];
    self.bindBlock(cell, model);
}

#pragma mark    每一个row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataSources[indexPath.row];
    if (self.heightBlock) {
        return  self.heightBlock(model);
    }
    return 44;
}
#pragma mark   点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
