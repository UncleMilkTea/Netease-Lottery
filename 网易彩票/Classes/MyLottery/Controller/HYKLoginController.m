//
//  HYKLoginController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/15.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKLoginController.h"
#import "HYKSettingController.h"
#import "HYKHelpController.h"

@interface HYKLoginController ()

@end

@implementation HYKLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)go2SettingVc:(UIBarButtonItem *)sender {
    
    HYKSettingController *setting = [[HYKSettingController alloc]init];
    
    setting.navigationItem.title = @"设置";
    
    setting.plistName = @"HYKSetting";
    
    UIBarButtonItem *item  =[[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(go2HelpVc)];
    
    setting.navigationItem.rightBarButtonItem = item;
    
    [self.navigationController pushViewController:setting animated:YES];
    
}

- (void)go2HelpVc {
    
    HYKHelpController *help  =[[HYKHelpController alloc]init];
    
    [self.navigationController pushViewController:help animated:YES];
    
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
