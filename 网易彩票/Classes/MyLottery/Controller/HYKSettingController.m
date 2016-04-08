//
//  HYKSetControllerViewController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/15.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKSettingController.h"
#import "HYKSettingCell.h"



@interface HYKSettingController ()

@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation HYKSettingController

#pragma mark - 设置分组样式
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //打印沙盒路径
    HYKLog(@"%@",NSHomeDirectory());

}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSDictionary *dict = self.dataArray[section];
    
   return [dict[HYKItems] count];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NSDictionary *dict = self.dataArray[indexPath.section];
    
        NSArray *items = dict[HYKItems];
    
        NSDictionary *item = items[indexPath.row];
    
    HYKSettingCell *cell = [HYKSettingCell cellWithTable:tableView andItem:item];
    
    cell.item = item;
  
    return cell;
}


#pragma mark - 数据源代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//!取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *group = self.dataArray[indexPath.section];
    
    NSArray *items = group[HYKItems];
    
    NSDictionary *item = items[indexPath.row];

    SEL selector = NSSelectorFromString(item[HYKUpdateVersion]);
    
    // 1.2.4 执行
    if ([self respondsToSelector:selector]) {
        
        // 屏蔽系统警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        // 执行方法
        [self performSelector:selector];
#pragma clang diagnostic pop
    }

//    if ([item[HYKTargetVc] length]<=0) {
//        
//        return;
//    }
    
    NSString *targetVc = item[HYKTargetVc];
    
    Class className = NSClassFromString(targetVc);
    
    UIViewController *obj = [[className alloc]init];
    
    obj.navigationItem.title = item[HYKTitle];

    
    if ([obj isKindOfClass:[HYKSettingController class]]) {
        
        HYKSettingController *nextVc = (HYKSettingController *)obj;
        
        nextVc.plistName = item[HYKPlistName];
        
        [self.navigationController pushViewController:nextVc animated:YES];
        
    }else {
    
        [self.navigationController pushViewController:obj animated:YES];
    
    }
}

- (void)UpdateVersion {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma mark - 重写组头组尾方法
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSDictionary *group = self.dataArray[section];
    
    return group[HYKHeader];
 }

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {

    NSDictionary *group = self.dataArray[section];
    
    return group[HYKFooter];
}


#pragma mark - 懒加载数据
- (NSArray *)dataArray {
    
    if (nil == _dataArray) {
        
        _dataArray = [NSArray arrayWithContentsOfFile:
                              
                              [[NSBundle mainBundle]
                               
                               pathForResource:_plistName
                               
                               ofType:@"plist"]];
    }
    
    return _dataArray;
}

@end
