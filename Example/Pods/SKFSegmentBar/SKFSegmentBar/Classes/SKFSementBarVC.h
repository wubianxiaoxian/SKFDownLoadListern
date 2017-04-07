//
//  SKFSementBarVC.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/3/31.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKFSegmentBar.h"
@interface SKFSementBarVC : UIViewController
@property (nonatomic, weak) SKFSegmentBar *segmentBar;


- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

@end
