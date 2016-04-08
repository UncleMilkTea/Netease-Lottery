//
//  HYKScoreController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/20.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKScoreController.h"
#import "HYKSettingCell.h"

@interface HYKScoreController ()
//! 文本框
@property (nonatomic,strong) UITextField *filed;
//! 时间选择
@property(strong,nonatomic) UIDatePicker *datePicker;
//! 工具条
@property(strong,nonatomic) UIToolbar *toolBar;
//! 用户选中的cell
@property (nonatomic,weak)HYKSettingCell *selectCell;

@end

@implementation HYKScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//!继承父类的操作
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        return;
    }
    
    HYKSettingCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    
    _selectCell = selectCell;
    
    [selectCell.contentView addSubview:self.filed];
    
    [self.filed becomeFirstResponder];
    



}


//! 取消
- (void)cancelItemclick {

    [self.filed resignFirstResponder];

}

//! 确定
- (void)confirmItemClick {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"HH:mm";
    
    [self.selectCell setTime:[formatter stringFromDate:self.datePicker.date]];
    
    [self.filed resignFirstResponder];


}

#pragma mark - 懒加载控件
- (UITextField *)filed {
    if (_filed == nil) {
        _filed = [[UITextField alloc]init];
        
        _filed.inputView = self.datePicker;
        
        _filed.inputAccessoryView = self.toolBar;
    }

    return _filed;
}

- (UIDatePicker *)datePicker {

    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc]init];
        
        _datePicker.datePickerMode = UIDatePickerModeTime;
        
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    
    return _datePicker;

}

- (UIToolbar *)toolBar {

    if (_toolBar == nil) {
        _toolBar = [[UIToolbar alloc]init];
        
        _toolBar.height = 44;
        
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemclick)];
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *sure = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmItemClick)];
        
        _toolBar.items = @[cancel,flex,sure];
        
        
    }

    return _toolBar;

}

@end
