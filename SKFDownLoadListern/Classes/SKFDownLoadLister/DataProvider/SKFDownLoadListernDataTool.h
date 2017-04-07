//
//  SKFDownLoadListernDataTool.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKFDownLoadVoiceModel.h"
#import "SKFAlbumModel.h"
@interface SKFDownLoadListernDataTool : NSObject
+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadingVoiceMs;

+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadedVoiceMs;
+ (NSArray <SKFDownLoadVoiceModel *>*)getDownLoadedVoiceMsInAlbumID: (NSInteger)albumID;

+ (NSArray <SKFAlbumModel *>*)getDownLoadedAlbums;
@end
