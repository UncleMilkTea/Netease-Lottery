//
//  HYKTabBarControllerTableViewController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.

#import "HYKTabBarControllerTableViewController.h"
#import "HYKBottomView.h"
#import "HYKNavigationController.h"

@interface HYKTabBarControllerTableViewController ()<HYKBottomViewDelegate>

@end

@implementation HYKTabBarControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self stepChildenController];
    
    [self stepButtonView];
    
}

- (void)stepChildenController {
    
    NSArray *array = @[@"HYKHall",@"HYKArena",@"HYKDiscovery",@"HYKHistory",@"HYKMyLottery"];
    
     NSMutableArray *storyBoardArray = [NSMutableArray array];
    
    for (NSString *name in array) {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
        
        UINavigationController *nav = [storyBoard instantiateInitialViewController];
        
        nav.topViewController.view.backgroundColor = RANDOMCOLOR;
        
        [storyBoardArray addObject:nav];
    }
    
    self.viewControllers = storyBoardArray;
}

- (void)stepButtonView {
    
    HYKBottomView *btnView = [[HYKBottomView alloc]initWithFrame:self.tabBar.bounds];
    
#warning 代理放到这儿才能设置初始界面停靠位置
    btnView.delegate = self;
    
    [self.tabBar addSubview:btnView];
    
    for (int i=0; i<self.childViewControllers.count; i++) {
        
        [btnView stepButtonImageName:[NSString stringWithFormat:@"TabBar%d",i+1] andSelectName:[NSString stringWithFormat:@"TabBar%dSel",i+1]];
    }
    
}

- (void)didJumpToSelectView:(HYKBottomView *)bottomView didSelectIndex:(NSInteger)selectIndex {
    
    self.selectedIndex = selectIndex
    ;
}

@end
