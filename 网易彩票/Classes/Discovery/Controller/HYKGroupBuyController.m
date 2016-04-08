//
//  HYKGroupBuyController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/14.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKGroupBuyController.h"
#import "HYKGroupButton.h"

@interface HYKGroupBuyController ()

@property (nonatomic,strong)UIView *colorView;

@end

@implementation HYKGroupBuyController

// 懒加载View
- (UIView *)colorView {
    
    if (_colorView == nil) {
        
        _colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, 0)];
        
        _colorView.backgroundColor = RANDOMCOLOR;
        
        [self.view addSubview:_colorView];
        
    }

    return _colorView;
}

- (void)viewDidLoad {
  
    [super viewDidLoad];
    
}



- (IBAction)groupButtonClick:(HYKGroupButton *)sender {
    
    if (self.colorView.height == 0) {
        
        [UIView animateWithDuration:.5 animations:^{
            
            self.colorView.height = 200;
            
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
            
        }];
        
        
    }else {
    
        [UIView animateWithDuration:.5 animations:^{
            
            self.colorView.height = 0;
            
            sender.imageView.transform = CGAffineTransformIdentity;
        }];
    }
}

@end
