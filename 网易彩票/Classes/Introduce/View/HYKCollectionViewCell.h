//
//  HYKCollectionViewCell.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HYKCollectionViewCell;

@protocol HYKCollectionViewCellDelegate <NSObject>

- (void)collectionViewCell:(HYKCollectionViewCell *)cell didFinishJumpBtn:(UIButton *)jumpBtn;

@end

@interface HYKCollectionViewCell : UICollectionViewCell

@property(strong,nonatomic) UIImage *image;

@property(assign,nonatomic) id<HYKCollectionViewCellDelegate> delegate;

@property(strong,nonatomic) UIButton *jumpBtn;


@end
