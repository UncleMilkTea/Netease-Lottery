//
//  ViewController.m
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import "ChatViewController.h"
#import "QQChatModel.h"
#import "QQChatCell.h"
#import "QQChatFrameModel.h"
@interface ChatViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>

@property (weak,nonatomic)IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end
/**
 *  重用标识
 */
static NSString *identifer = @"QQ";

@implementation ChatViewController
/**
 *  懒加载
 */


- (NSMutableArray *)dataArray{
    if (nil == _dataArray) {
//        #warning 直接使用可变数组需要实例化数组对象
        _dataArray = [NSMutableArray array];
        NSArray *tempArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil]];
//        NSMutableArray *dataArray = [NSMutableArray array];
        
        for (NSDictionary *object in tempArray) {
            
            QQChatModel *model= [QQChatModel QQChatModel:object];
            
            QQChatFrameModel *frameModel = [[QQChatFrameModel alloc]init];
            frameModel.qqChatModel = model;
            QQChatFrameModel *lastmodel = _dataArray.lastObject;
            
            if ( [lastmodel.qqChatModel.time isEqualToString: model.time] ) {
                model.hidenLabel = YES;
            }
            [_dataArray addObject:frameModel];
        }
    }
    return _dataArray;


}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
     // 向tableView注册cell
    
    [self.tableView registerClass:[QQChatCell class] forCellReuseIdentifier:identifer];
    
    // 键盘由系统发出,只要注册
    [self registerNotification];
    
    
    //设置文本框代理
   self.inputField.delegate = self;
    
    //加载的时候直接滚动到底部
    [self scrollToRow];
    
}
#pragma mark --注册监听
- (void)registerNotification{
    
    [ [NSNotificationCenter defaultCenter]
     addObserver:self
        selector:@selector(keyboardWillAppear:)
            name:UIKeyboardWillShowNotification
          object:nil];
    
    [ [NSNotificationCenter defaultCenter]
     addObserver:self
        selector:@selector(keyboardWillDidAppear:)
            name:UIKeyboardWillHideNotification
          object:nil];
    
}
/**
 *  键盘显示的时候调用
 *
*/
- (void)keyboardWillAppear:(NSNotification *)noti{
    NSDictionary *inforDict = noti.userInfo;
    CGFloat interval = [inforDict [UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    CGRect startLocation = [inforDict[UIKeyboardFrameBeginUserInfoKey]CGRectValue];
    CGRect endLocation = [inforDict [UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat move = endLocation.origin.y - startLocation.origin.y;
    [UIView animateWithDuration:interval animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, move);
    }];
   
}
/**
 *  键盘隐藏的时候调用
*/
- (void)keyboardWillDidAppear:(NSNotification *)noti{
    NSDictionary *inforDict = noti.userInfo;
    CGFloat interval = [inforDict [UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    [UIView animateWithDuration:interval animations:^{
        self.view.transform = CGAffineTransformIdentity;
    }];
    
}

/**
 *  实现系统回车发送代理方法
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    
    [self sendMessageWith:textField.text type:QQChatTyeMe];
    
    [self sendMessageWith:@"系统繁忙,请稍后重试...." type:QQChatTyeOther];
    
    
    [textField setText:nil];

    return YES;
}
/**
 *  滚动到最新消息
 */
- (void)scrollToRow{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];

[_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}

- (void)sendMessageWith:(NSString *)text type:(QQChatTye) type{
 
    QQChatModel *chatModel = [[QQChatModel alloc]init];
    chatModel.text = text;
    //将当前时间转成字符串
    NSDateFormatter * dateFormat = [[NSDateFormatter alloc]init];
    dateFormat.dateFormat = @"HH:mm";
    chatModel.time = [dateFormat stringFromDate:[NSDate date]];
    
    chatModel.type = type;
   
    //判断时间是否需要隐藏
    QQChatFrameModel *chatFrameModel = [[QQChatFrameModel alloc]init];
    chatFrameModel.qqChatModel = chatModel;
    QQChatFrameModel *lastFrameModel = self.dataArray.lastObject;
    if ([lastFrameModel.qqChatModel.time isEqualToString:chatModel.time]) {
        chatModel.hidenLabel = YES;
    }
    
    [self.dataArray addObject:chatFrameModel];
    
    
    //插入到最后cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    //刷新数据加动画
    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //滚动到刚插入的cell
    [self scrollToRow];

}










/**
 *  有多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
/**
 *  
    每组有多少个
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;

}

/**
 *  每个cell的内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    /**
     *  到缓存池中找cell
     */
    QQChatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    
    /**
     *  引入model的数据
     */
    
    QQChatFrameModel *qqChatFameModel = self.dataArray[indexPath.row];
   
    /**
     *  给cell赋值
     */
    cell.qqChatFrameModel = qqChatFameModel;
    // 显示下划线颜色
    _tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;

    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QQChatFrameModel *frameModel = self.dataArray[indexPath.row];
    return frameModel.cellHeigth;
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
