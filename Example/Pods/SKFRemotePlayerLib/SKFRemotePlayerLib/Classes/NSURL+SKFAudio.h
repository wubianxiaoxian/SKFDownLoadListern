//
//  NSURL+SKFAudio.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SKFAudio)
- (NSURL *)streamingURL;

- (NSURL *)httpURL;
@end
