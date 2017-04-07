//
//  SKFDownLoadBaseTVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef UITableViewCell *(^GetCellBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef CGFloat (^GetHeightBlock)(id model);
typedef void (^BindBlock)(__kindof UITableViewCell *cell, id model);
@interface SKFDownLoadBaseTVC : UITableViewController
- (void)setUpWithDataSouce: (NSArray *)dataSource getCell: (GetCellBlock)cellBlock cellHeight: (GetHeightBlock)cellHeightBlock bind: (BindBlock)bindBlock;
@end
