//
//  LuckImageButton.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/12.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "LuckImageButton.h"

@implementation LuckImageButton


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat W = 40;
    CGFloat H = 47;
    CGFloat X = (contentRect.size.width - W)*.5;
    CGFloat Y = 20;
   
    return CGRectMake(X, Y, W, H);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end
