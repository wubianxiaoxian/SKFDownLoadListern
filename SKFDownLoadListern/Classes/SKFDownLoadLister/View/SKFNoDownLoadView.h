//
//  SKFNoDownLoadView.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKFNoDownLoadView : UIView
+ (instancetype)noDownLoadView;
@property (nonatomic, strong) UIImage *noDataImg;
@property(nonatomic,copy) void(^clickBlock)();
@end
