//
//  HYKBottomView.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYKBottomView;

@protocol HYKBottomViewDelegate <NSObject>

- (void)didJumpToSelectView:(HYKBottomView *)bottomView didSelectIndex:(NSInteger)selectIndex;

@end

@interface HYKBottomView : UIView
/**
 *  创建按钮的对外方法
 */

- (void)stepButtonImageName:(NSString *)normalName andSelectName:(NSString *)selectName;

@property(assign,nonatomic) id<HYKBottomViewDelegate> delegate;

@end
