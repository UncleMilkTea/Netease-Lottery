//
//  HYKSettingCell.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/20.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKSettingCell.h"


@implementation HYKSettingCell

+ (instancetype)cellWithTable:(UITableView *)tableView andItem:(NSDictionary *)item {

   static NSString *identifier = @"cell";
    
    HYKSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        
        cell = [[HYKSettingCell alloc]initWithStyle:[self cellStyleWithitem:item] reuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - 返回cell的样式
+ (UITableViewCellStyle)cellStyleWithitem:(NSDictionary *)item {
    
    NSString *cellStyle = item[HYKCellStyle];
    
    if ([cellStyle
         isEqualToString:@"UITableViewCellStyleValue2"]) {
        
        return UITableViewCellStyleValue2;
    }
    else if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]){
        
        return UITableViewCellStyleSubtitle;
    }
    else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]){
        
        return UITableViewCellStyleValue1;
    }else {
        
        return UITableViewCellStyleDefault;
    }
    
    
}


- (void)setTime:(NSString *)timeStr {


    self.detailTextLabel.text = timeStr;
    
    [self switchChange:timeStr];

}

#pragma mark - 设置cell数据重写item
- (void)setItem:(NSDictionary *)item {

    _item = item;
    
    if ([item[HYKIcon] length] > 0) {
        
        self.imageView.image = [UIImage imageNamed:item[HYKIcon]];
    }
    
    self.textLabel.text = item[HYKTitle];
    
    self.detailTextLabel.text = item[HYKSubTitle];
    
    if ([item[HYKTimer] length]>0) {
        
        NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
        
        NSString *str = [defaults stringForKey:item[HYKTimer]];
        
        if (str.length>0) {
            
            self.detailTextLabel.text = str;
        }
   }
    

//! 判断子标题是否高亮
    BOOL isHighLight = item[HYKHightLight];
    
    if (isHighLight) {
        
        self.detailTextLabel.textColor = [UIColor redColor];
        
    } else {
        
        self.detailTextLabel.textColor = [UIColor blackColor];
    }
 
// 设置辅助视图
    Class className = NSClassFromString(item[HYKAccessoryType]);
#warning 如果类型的字符串没有值，就返回。
    if ([item[HYKAccessoryType] length]<=0) {
        
        return;
    }
    
    id obj = [[className alloc]init];
    
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        UIImageView *imageView = (UIImageView *)obj;
        
        imageView.image  =[UIImage imageNamed:item[HYKAccessoryName]];
        
        [imageView sizeToFit];
        
        self.accessoryView  = imageView;
        
    }else {
        
        
        UISwitch *swith = (UISwitch *)obj;
        
#pragma maek - 读取开关状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        swith.on = [defaults boolForKey:_item[HYKKeyName]];
        
        self.accessoryView = swith;
        
#pragma maek - 存储开关状态
        [swith addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
        
    }
}


- (void)switchChange:(id)sender {
// 获取偏好设置
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
// 保存数据
    if ([sender isKindOfClass:[UISwitch class]]) {
        
        [defaults setBool:[(UISwitch *)sender isOn] forKey:_item[HYKKeyName]];
        
    }else {
    
        [defaults setObject:sender forKey:_item[HYKTimer]];
    
    }
    
// 同步

    [defaults synchronize];

}

@end
