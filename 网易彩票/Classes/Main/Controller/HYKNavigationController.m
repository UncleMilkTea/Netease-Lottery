//
//  HYKNavigationController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKNavigationController.h"

@interface HYKNavigationController ()

@end

@implementation HYKNavigationController

+ (void)initialize {

    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //获取当前版本信息
    if ([[UIDevice currentDevice].systemVersion doubleValue]>7.0) {

    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    }else {
        /**
         *  UIBarMetricsDefault,
         UIBarMetricsCompact,//navgation item 的ptomit属性可以再横屏显示
         UIBarMetricsDefaultPrompt = 101
         */
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"]forBarMetrics:UIBarMetricsDefault];
    }
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [navBar setTintColor:[UIColor whiteColor]];

}

#pragma mark - push的时候用来隐藏下面选择栏

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    viewController.hidesBottomBarWhenPushed = YES;
    
#warning 这里调用必须是父类才能调用,self会蹦
    [super pushViewController:viewController animated:YES];

}
@end
