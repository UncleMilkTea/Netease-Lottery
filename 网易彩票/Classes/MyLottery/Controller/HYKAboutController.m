//
//  HYKAboutController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKAboutController.h"

@interface HYKAboutController ()

@end

@implementation HYKAboutController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *headView = [[[NSBundle mainBundle] loadNibNamed:@"HYKAboutHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView  = headView;
    
    
    
}

//设置header的高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {


    return 20;

}

//!评分支持

- (void)scoreSupport {

    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/app/id411654863?mt=8"]];
    
 HYKLog(@"评分支持");
}

//!给客服打电话
- (void)callFadeem {
    
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    
    [[UIApplication sharedApplication] openURL:url];
    
    HYKLog(@"给客服打电话");
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
