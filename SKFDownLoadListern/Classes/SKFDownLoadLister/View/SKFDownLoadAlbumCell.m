//
//  SKFDownLoadAlbumCell.m
//  喜马拉雅FM
//
//  Created by 王顺子 on 16/8/20.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "SKFDownLoadAlbumCell.h"


@implementation SKFDownLoadAlbumCell

static NSString *const cellID = @"downLoadAlbum";

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    SKFDownLoadAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (cell == nil) {
            cell = [[[NSBundle bundleForClass:self] loadNibNamed:@"SKFDownLoadAlbumCell" owner:nil options:nil] firstObject];
    }

    return cell;
}

- (IBAction)delete {

    if (self.deleteBlock) {
        self.deleteBlock();
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        if (self.selectBlock) {
            self.selectBlock();
        }
    }
}


@end
