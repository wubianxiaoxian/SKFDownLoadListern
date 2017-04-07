//
//  SKFAudioFileTool.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKFAudioFileTool : NSObject
+ (NSString *)cachePathWithURL: (NSURL *)url;
+ (NSString *)tmpPathWithURL: (NSURL *)url;

+ (BOOL)isCacheFileExists: (NSURL *)url;
+ (BOOL)isTmpFileExists: (NSURL *)url;


+ (NSString *)contentTypeWithURL: (NSURL *)url;


+ (long long)cacheFileSizeWithURL: (NSURL *)url;
+ (long long)tmpFileSizeWithURL: (NSURL *)url;

+ (void)removeTmpFileWithURL: (NSURL *)url;


+ (void)moveTmpPathToCachePath: (NSURL *)url;
@end
