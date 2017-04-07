//
//  SKFAudioDownLoader.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol SKFAudioDownLoaderDelegate <NSObject>

- (void)downLoaderLoading;

@end

@interface SKFAudioDownLoader : NSObject
@property (nonatomic, assign) long long loadedSize;
@property (nonatomic, assign) long long offset;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, assign) long long totalSize;

@property (nonatomic, weak) id<SKFAudioDownLoaderDelegate> delegate;

- (void)downLoadWithURL: (NSURL *)url offset: (long long)offset;
@end
