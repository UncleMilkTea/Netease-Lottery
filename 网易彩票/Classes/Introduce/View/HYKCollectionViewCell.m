//
//  HYKCollectionViewCell.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKCollectionViewCell.h"

@interface HYKCollectionViewCell ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation HYKCollectionViewCell

- (void)setImage:(UIImage *)image {

    _image = image;
    
    _imageView.image = image;
    

}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageView];
        
        _jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_jumpBtn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_jumpBtn sizeToFit];
        
        _jumpBtn.frame = CGRectMake((self.width - _jumpBtn.width) * .5, self.height * .85, _jumpBtn.width, _jumpBtn.height);
        
        _jumpBtn.hidden = YES;
        
        [self.contentView addSubview:_jumpBtn];
        
        [_jumpBtn addTarget:self action:@selector(clickJumpBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
- (void)clickJumpBtn:(UIButton *)btn {

    if ([self.delegate respondsToSelector:@selector(collectionViewCell:didFinishJumpBtn:)]) {
        
        [self.delegate collectionViewCell:self didFinishJumpBtn:btn];
        
    }
}

@end
