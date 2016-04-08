//
//  QQChatCellTableViewCell.m
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import "QQChatCell.h"
#import "QQChatModel.h"
#import "QQChatFrameModel.h"
#define MEINAGE [UIImage imageNamed:@"chat_send_nor"]
#define OTHERIMAGE [UIImage imageNamed:@"chat_recive_press_pic"]

@interface QQChatCell()
/**
 *  时间label
 */

@property (weak,nonatomic) UILabel *timeLabel;
/**
*  头像UIImageView
*/
@property (weak,nonatomic) UIImageView *iconImageView;
/**
*  聊天label
*/
@property (weak ,nonatomic) UIButton *contectButton;


@end



@implementation QQChatCell




/**
 *  重写initWithStyle方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self steupUI];
    }
    return self;
}

#pragma  mark 初始化cell

- (void)steupUI{

    
    //设置时间
    UILabel *timeLabel = [[UILabel alloc]init];
    self.timeLabel = timeLabel;
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:timeLabel];
    
    
    
    
    
    
    
    //设置头像
    UIImageView *imageView = [[UIImageView alloc]init];
    self.iconImageView = imageView;
    [self.contentView addSubview:imageView];
    
    

    
    
//设置聊天框
    UIButton *contectButton  =[[UIButton alloc]init];
    self.contectButton = contectButton;
    [contectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    contectButton.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:contectButton];

}
/**
 *  重写QQChatFrameModel属性的setter方法
 */

- (void)setQqChatFrameModel:(QQChatFrameModel *)qqChatFrameModel{
//实例化
    _qqChatFrameModel = qqChatFrameModel;
    /**
     *  设置数据
     */
    [self stupData];
    /**
     *  设置位置
     */
    [self stupFrame];


}

- (void)stupData{
    QQChatModel *qqChatModel = _qqChatFrameModel.qqChatModel;
    //时间
    _timeLabel.text = qqChatModel.time;
    _timeLabel.hidden = qqChatModel.isHiddenLabel;
    
    //头像
    if (qqChatModel.type == QQChatTyeMe) {
        
        _iconImageView.image = [UIImage imageNamed:@"me"];
    }else{
        _iconImageView.image = [UIImage imageNamed:@"xiaopingguo"];
    }
  
    
    
    //聊天
    [_contectButton setTitle:qqChatModel.text forState:UIControlStateNormal];
    _contectButton.titleLabel.font = [UIFont systemFontOfSize:15];
    _contectButton.contentEdgeInsets =UIEdgeInsetsMake(20, 20, 20, 20);

    if (qqChatModel.type == QQChatTyeMe) {
        
        CGFloat imageHalfWidth = MEINAGE.size.width/2;
        
        CGFloat imageHalfHeigth = MEINAGE.size.height/2;
        
        UIImage *imageRealSize = [MEINAGE resizableImageWithCapInsets:UIEdgeInsetsMake(imageHalfWidth, imageHalfHeigth, imageHalfWidth, imageHalfHeigth) resizingMode:UIImageResizingModeStretch];
        [_contectButton setBackgroundImage:imageRealSize forState:UIControlStateNormal];
    }else{
    
        CGFloat imageHalfWidth = OTHERIMAGE.size.width/2;
        
        CGFloat imageHalfHeigth = OTHERIMAGE.size.height/2;
        
        UIImage *imageRealSize = [OTHERIMAGE resizableImageWithCapInsets:UIEdgeInsetsMake(imageHalfWidth, imageHalfHeigth, imageHalfWidth, imageHalfHeigth) resizingMode:UIImageResizingModeStretch];
        [_contectButton setBackgroundImage:imageRealSize forState:UIControlStateNormal];
    
    
    
    }
    
    
    
    
    
    
}
- (void)stupFrame{
    _iconImageView.frame = _qqChatFrameModel.iconLabelFrame;//头像
    _contectButton.frame = _qqChatFrameModel.contectLabelFrame;//聊天
    _timeLabel.frame = _qqChatFrameModel.timeLabelFrame;//时间
    
}




@end
