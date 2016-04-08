//
//  LuckView.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/12.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "LuckView.h"
#import "PrefixHeader.pch"
#import "LuckImageButton.h"

@interface LuckView ()

@property (weak, nonatomic) IBOutlet UIImageView *luckViewWheel;

@property(strong,nonatomic) UIButton *selectBtn;

@property(strong,nonatomic) CADisplayLink *link;

@end

NSInteger imageCount = 12;

@implementation LuckView

+ (instancetype)luckView {

    return [[[NSBundle mainBundle] loadNibNamed:@"LuckView" owner:nil options:nil] lastObject];

}
- (IBAction)startNumber:(UIButton *)sender {
   //结束刷新
    [_link invalidate];
    
    _link = nil;
    
    self.userInteractionEnabled = NO;
    
    CABasicAnimation *animator = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    animator.toValue = @(M_PI * 12 - _selectBtn.tag * (M_PI * 2 / 12));
    
    animator.duration = 3;
    
//    animator.fillMode =kCAFillModeForwards;
    
//    animator.removedOnCompletion = NO;
    
    animator.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    animator.delegate = self;
    
    [_luckViewWheel.layer addAnimation:animator forKey:nil];
    
    
}

#pragma mark - 当核心动画结束后让轮转真实的transform返回去
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    _luckViewWheel.transform = CGAffineTransformMakeRotation(M_PI * 2-_selectBtn.tag * (M_PI * 2 / 12));

    if ([self.delegate respondsToSelector:@selector(didiFinishChooseNumber:)]) {
        [self.delegate didiFinishChooseNumber:self];
    }

}


#pragma mark 添加按钮
- (void)awakeFromNib {

    UIView *cover = [[UIView alloc]init];
    
    cover.layer.cornerRadius = 60;
    
    cover.backgroundColor = [UIColor clearColor];
    
    cover.bounds = CGRectMake(0, 0, 120, 120);
    cover.center = _luckViewWheel.center;
    
    [self insertSubview:cover aboveSubview:_luckViewWheel];
    
    
    for (int i = 0 ; i < imageCount; i++) {
        
        LuckImageButton *btn = [LuckImageButton buttonWithType: UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        btn.tag = i;
        
        UIImage *normalImg = [self clipBtnImage:@"LuckyAstrology" andIndex:i];
        
        UIImage *selectImg = [self clipBtnImage:@"LuckyAstrologyPressed" andIndex:i];
        
        [btn setImage:normalImg forState:UIControlStateNormal];
        [btn setImage:selectImg forState:UIControlStateSelected];
        
        [_luckViewWheel addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark 布局子控件
- (void)layoutSubviews {

    [super layoutSubviews];
    
    CGFloat btnW = 68;
    
    CGFloat btnH = 143;
    
    CGFloat angle = M_PI * 2 / imageCount;
    
    [_luckViewWheel.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.bounds = CGRectMake(0, 0, btnW, btnH);
        
        obj.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
        obj.layer.anchorPoint = CGPointMake(.5, 1);
        
         obj.transform = CGAffineTransformMakeRotation(idx * angle);
    }];
    
}

- (void)btnClick:(LuckImageButton *)btn {

    _selectBtn.selected = NO;
    
    btn.selected = YES;
    
     _selectBtn = btn;
}

#pragma mark 转盘旋转
- (void)startRoate {

    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(roate)];
    
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)roate {

    _luckViewWheel.transform = CGAffineTransformRotate(_luckViewWheel.transform, M_1_PI/30);
}

#pragma mark 裁剪图片
- (UIImage *)clipBtnImage:(NSString *)imageName andIndex:(NSInteger)index {

    UIImage *img = [UIImage imageNamed:imageName];
    
    CGFloat imgW = img.size.width/imageCount;
    CGFloat imgH = img.size.height;
    CGFloat imgX = index * imgW;
    CGFloat imgY = 0;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    //屏幕缩放比
    imgW *= scale;
    
    imgH *= scale;
    
    imgY *= scale;
    
    imgX *= scale;
    
    CGImageRef cgImg = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(imgX, imgY, imgW, imgH));
    
    UIImage *clipImg = [UIImage imageWithCGImage:cgImg];
    
   CGImageRelease(cgImg);

    return clipImg;

}



@end
