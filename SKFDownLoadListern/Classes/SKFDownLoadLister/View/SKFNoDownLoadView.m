//
//  SKFNoDownLoadView.m
//  SKFDownLoadListern
//
//  Created by 孙凯峰 on 2017/4/1.
//  Copyright © 2017年 孙凯峰. All rights reserved.
//

#import "SKFNoDownLoadView.h"
@interface SKFNoDownLoadView()

@property (weak, nonatomic) IBOutlet UIImageView *noDataImageView;


@end

@implementation SKFNoDownLoadView
+ (instancetype)noDownLoadView {
    
    NSBundle *_currentBundle = [NSBundle bundleForClass:self];
    SKFNoDownLoadView *noDataView = [[_currentBundle loadNibNamed:@"SKFNoDownLoadView" owner:nil options:nil] firstObject];
    return noDataView;
}
- (void)setNoDataImg:(UIImage *)noDataImg {
    _noDataImg = noDataImg;
    self.noDataImageView.image = noDataImg;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (IBAction)goView:(id)sender {
    if (self.clickBlock) {
        self.clickBlock();
    }
}

@end
