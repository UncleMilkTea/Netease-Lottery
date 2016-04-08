//
//  ViewController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/12.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "LuckViewController.h"
#import "LuckView.h"

@interface LuckViewController ()<LuckViewDelegate>
{
    UIImageView *_imageView;
    UIView *_cover;
    LuckView *_luckViwe;

}
@property (weak, nonatomic) IBOutlet UIButton *constellationBtn;

@end

@implementation LuckViewController


- (IBAction)constellationBtn:(UIButton *)sender {
    
    _luckViwe.normalImgName = @"LuckyAnimal";
    
    _luckViwe.selectImgName = @"LuckyAnimalPressed";
    
}
- (IBAction)twoColorGlobeBtn:(UIButton *)sender {
    
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    LuckView *luckView = [LuckView luckView];
    
    luckView.normalImgName = @"LuckyAnimal";
    
    luckView.selectImgName = @"LuckyAnimalPressed";
    
    luckView.center = self.view.center;
    
    [self.view addSubview:luckView];
    
    luckView.delegate = self;
    
    [luckView  startRoate];
    
    _luckViwe = luckView;
    
}
//- (void)didiFinishChooseNumber:(LuckView *)luckViwe {
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"1,3,4,4,5" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            
//            [luckViwe startRoate];
//            
//            luckViwe.userInteractionEnabled = YES;
//
//        }];
//        
//                [alertVc addAction:action];
//        
//        [self presentViewController:alertVc animated:YES completion:nil];
//    });
//
//    
//}

- (void)didiFinishChooseNumber:(LuckView *)luckViwe {
    
    _luckViwe = luckViwe;

    _cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LuckyConfirmBack"]];
    
#pragma mark - 创建中间财神图片
    UIImageView *midImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lucky_lots_tuhao"]];
    
    midImage.center = _imageView.center;
    
    midImage.transform  = CGAffineTransformMakeTranslation(0, 50);
    
    midImage.bounds = CGRectMake(0, 0, 230, 200);
    
    [_imageView addSubview:midImage];
    
#pragma mark - 创建吐出黄色view
    UIView *jumpView = [[UIView alloc]initWithFrame:CGRectMake(14, 38, _imageView.width-30, 0)];
    
    jumpView.backgroundColor  =[UIColor yellowColor];
    
    jumpView.alpha = .5;
    
    jumpView.layer.cornerRadius = 6;
#pragma mark - 纸条动态吐出延时
    [UIView animateWithDuration:1 animations:^{
        
        UILabel *label = [[UILabel alloc]initWithFrame:jumpView.bounds];
        
        NSMutableString *str = [NSMutableString string];
#pragma mark - 动态随机生成7个号码因为转盘旋转了7圈
        for (int i =0 ; i<3; i++) {
            
            [str appendString:[NSString stringWithFormat:@"%d - %d - ",arc4random_uniform(10)+1,arc4random_uniform(10)+1]];
        }
        
        [str appendString:[NSString stringWithFormat:@"%d",arc4random_uniform(10)+1]];
        
        label.text = str;
        
        label.textColor = [UIColor redColor];
        
        label.font = [UIFont systemFontOfSize:20];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.height = 42;
        
        [jumpView addSubview:label];
        
        jumpView.height = 42;
        
        [_imageView addSubview:jumpView];
    }];
    
    _imageView.center = self.tabBarController.view.center;
    
    _cover.backgroundColor = [UIColor blackColor];
    
    _cover.alpha = 0.5;
    
    [self.tabBarController.view addSubview:_cover];
    
    [self.tabBarController.view addSubview:_imageView];
    
    
    _imageView.userInteractionEnabled = YES;
    
#pragma mark - 创建关闭按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"LuckyConfirmClose"] forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(_imageView.frame.size.width-22, 0, 22, 22);
    
    [_imageView addSubview:btn];
    
    [btn addTarget:self action:@selector(clickCloseImage) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 按钮点击事件
- (void)clickCloseImage {
    
    [UIView animateWithDuration:.5 animations:^{
        _imageView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [_luckViwe startRoate];
        
        _luckViwe.userInteractionEnabled = YES;
        
        [_cover removeFromSuperview];
    }];
    
}


@end
