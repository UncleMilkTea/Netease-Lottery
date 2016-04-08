//
//  HYKBottomView.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKBottomView.h"
#import "HYKButtomBtn.h"

@interface HYKBottomView ()
{

    UIButton *_selectBtn;
}
@end

@implementation HYKBottomView

- (void)stepButtonImageName:(NSString *)normalName andSelectName:(NSString *)selectName {

    HYKButtomBtn *btn = [HYKButtomBtn buttonWithType:UIButtonTypeCustom];
    
#warning 代理放到这儿才能设置初始界面停靠位置
    btn.tag = self.subviews.count;
    
    [btn setImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];

    [self addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //默认选中我的彩票
    if (self.subviews.count == 5) {
        
        [self btnClick:btn];
        
    }

}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    CGFloat w = self.width/self.subviews.count;
    CGFloat h = self.height;
    CGFloat y = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof HYKButtomBtn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
                obj.frame = CGRectMake(idx * w, y, w, h);
        
//        obj.tag = idx;
//        
//        if (idx == 5) {
//            [self btnClick:obj];
//        }

        
    }];
}

- (void)btnClick:(HYKButtomBtn *)btn {
    
    
    if (btn.selected == YES) {
        return;
    }

    //交换选中状态
    _selectBtn.selected = NO;
    
    btn.selected = YES;
    
    _selectBtn = btn;
    
    //执行页面跳转代理
    
    if ([self.delegate respondsToSelector:@selector(didJumpToSelectView:didSelectIndex:)]) {

        [self.delegate didJumpToSelectView:self didSelectIndex:btn.tag];
        
    }

}



@end
