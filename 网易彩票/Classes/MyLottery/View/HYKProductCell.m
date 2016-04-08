//
//  HYKProductCell.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKProductCell.h"
#import "HYKProduct.h"

@interface HYKProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation HYKProductCell

- (void)setProduct:(HYKProduct *)product {

    _product = product;
    
    NSString *imgName = [product.icon substringToIndex:product.icon.length - @"@2x.png".length];
    
    self.imageView.image = [UIImage imageNamed:imgName];
    
    self.label.text = _product.title;

}

- (void)awakeFromNib {


    self.imageView.layer.cornerRadius = 5;
    
    self.imageView.layer.masksToBounds = YES;
}



@end
