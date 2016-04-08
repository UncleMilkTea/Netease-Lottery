//
//  LuckView.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/12.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LuckView;

@protocol LuckViewDelegate <NSObject>

- (void)didiFinishChooseNumber:(LuckView *)luckViwe;

@end
@interface LuckView : UIView
/**
 *  快速创建对象的类方法
 */
+ (instancetype)luckView;
/**
 *  转盘旋转的方法
 */
- (void)startRoate;
@property(assign,nonatomic) id<LuckViewDelegate> delegate;

@end
