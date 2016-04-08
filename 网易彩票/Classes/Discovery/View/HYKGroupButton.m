//
//  HYKGroupButton.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/14.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKGroupButton.h"

@implementation HYKGroupButton

- (void)layoutSubviews {

    [super layoutSubviews];
    
    //手动调整 按钮中位置
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width+5;
    
}


@end
