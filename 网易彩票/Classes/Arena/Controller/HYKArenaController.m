//
//  HYKArenaController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/14.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKArenaController.h"

@interface HYKArenaController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation HYKArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"NLArenaBackground"].CGImage;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName : [UIColor whiteColor]
                          };
    
    [_segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [_segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    [_segment setTitleTextAttributes:dic forState:UIControlStateSelected];
    

}

@end
