
//
//  HYKHallTableViewController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKHalTableViewController.h"
@interface HYKHallTableViewController () {

    UIView *_cover;

    UIImageView *_imageView;

}
@end

@implementation HYKHallTableViewController

- (void)viewDidLoad {

    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 2;
}







- (IBAction)clickAcitvity:(UIButton *)sender {
    
    _cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    
    _imageView.center = self.tabBarController.view.center;
    
    _cover.backgroundColor = [UIColor blackColor];
    
    _cover.alpha = 0.5;
    
    [self.tabBarController.view addSubview:_cover];
    
    [self.tabBarController.view addSubview:_imageView];
    
    
    _imageView.userInteractionEnabled = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
 //   [btn sizeToFit];//可以设置图片大小自适应
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
    btn.frame = CGRectMake(_imageView.frame.size.width-20, 0, 20, 20);
    
    [_imageView addSubview:btn];
    
    [btn addTarget:self action:@selector(clickCloseImage) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickCloseImage {

[UIView animateWithDuration:.5 animations:^{
    _imageView.alpha = 0;
} completion:^(BOOL finished) {
    [_cover removeFromSuperview];
}];

}


@end
