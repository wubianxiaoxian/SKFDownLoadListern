//
//  SKFDownLoadAlbumCellPresenter.h
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/4.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKFAlbumModel.h"
#import "SKFDownLoadAlbumCell.h"
@interface SKFDownLoadAlbumCellPresenter : NSObject
@property (nonatomic, strong) SKFAlbumModel *albumModel;

- (void)bindWithCell: (SKFDownLoadAlbumCell *)cell;
@end
