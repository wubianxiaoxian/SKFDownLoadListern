//
//  SKFSegmentBarConfig.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/3/31.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import "SKFSegmentBarConfig.h"

@implementation SKFSegmentBarConfig
+ (instancetype)defaultConfig {
    
    SKFSegmentBarConfig *config = [[SKFSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.itemFont = [UIFont systemFontOfSize:15];
    config.itemNormalColor = [UIColor lightGrayColor];
    config.itemSelectColor = [UIColor redColor];
    
    config.indicatorColor = [UIColor redColor];
    config.indicatorHeight = 2;
    config.indicatorExtraW = 10;
    
    return config;
    
}
-(SKFSegmentBarConfig *(^)(UIColor *))itemNC{
    return ^(UIColor *color){
        self.itemNormalColor=color;
        return self;
    };
}

-(SKFSegmentBarConfig *(^)(UIColor *))itemSC{
    return ^(UIColor *color){
        self.itemSelectColor=color;
        return self;
    };
}

- (SKFSegmentBarConfig *(^)(CGFloat))indicatorEW
{
    return ^(CGFloat w) {
        self.indicatorExtraW = w;
        return self;
    };
}
@end
