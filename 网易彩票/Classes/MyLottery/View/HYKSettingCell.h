//
//  HYKSettingCell.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/20.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYKHeader        @"header"          // 组头
#define HYKFooter        @"footer"          // 组尾
#define HYKItems         @"HYKItem"         // 组内所有行数组
#define HYKTargetVc      @"HYKTargetVc"     // 目标控制器的类型的字符串
#define HYKTitle         @"title"           // 标题
#define HYKIcon          @"icon"            // 图片
#define HYKAccessoryType @"accessotyType"   // 辅助视图类型
#define HYKAccessoryName @"accessoryName"   // 辅助视图类型
#define HYKTargetVc      @"HYKTargetVc"     // 目标控制器的类型的字符串
#define HYKPlistName     @"plistName"       // plist文件名称
#warning 这里的HYKCellStyle plist文件多了一个空格
#define HYKCellStyle     @"HYKCellStyle"    // cell的样式
#define HYKSubTitle      @"SubTitle"        // 子标题
#define HYKHightLight    @"hightLight"      // 判断子标题颜色
#define HYKKeyName       @"HYKKeyName"      //存储开关的key
#define HYKUpdateVersion @"HYKUpdateVersion"//用来检查更新方法
#define HYKTimer         @"HYKTimer"        //存储时间


@interface HYKSettingCell : UITableViewCell

+ (instancetype)cellWithTable:(UITableView *)tableView andItem:(NSDictionary *)item;

- (void)setTime:(NSString *)timeStr;

@property(strong,nonatomic) NSDictionary *item;

@end
