//
//  QQChatFrameModel.m
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import "QQChatFrameModel.h"
#import "QQChatModel.h"
/**
 *  屏幕的宽
 */
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
/**
 *  边距
 */
#define MARGIN 10
@implementation QQChatFrameModel
/**
 *  重写QQChatModel的settter的方法初始化Frame的属性
 */
- (void)setQqChatModel:(QQChatModel *)qqChatModel{
    
//首先要实例化
    _qqChatModel = qqChatModel;
  //时间
    CGFloat timeWidth = SCREENWIDTH;
    CGFloat timeHeigth = 20;
    _timeLabelFrame = CGRectMake(0, 0, timeWidth, timeHeigth);

    
    
    //头像
    CGFloat iconWieth = 50;
    CGFloat iconHeigth = iconWieth;
    CGFloat iconX = MARGIN;
    CGFloat iconY = timeHeigth + MARGIN;
    if (qqChatModel.type) {
        iconX = SCREENWIDTH - iconWieth - MARGIN;
    }
    _iconLabelFrame = CGRectMake(iconX, iconY, iconWieth, iconHeigth);
//
//    
    //聊天框
    CGFloat contectWidth = SCREENWIDTH - 4*MARGIN - 2*iconWieth;
//    CGFloat contecHiegth = 300;
    CGFloat contectX = CGRectGetMaxX(_iconLabelFrame) + MARGIN;
    CGFloat contectY = iconY;
    CGSize contentRealSize = [_qqChatModel.text boundingRectWithSize:CGSizeMake(contectWidth, MAXFLOAT) options:( NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    if (qqChatModel.type) {
        contectX = SCREENWIDTH - contentRealSize.width - 2*MARGIN - iconWieth - 4*MARGIN ;
    }
    
    
    _contectLabelFrame = CGRectMake(contectX, contectY, contentRealSize.width , contentRealSize.height);
    _contectLabelFrame.size.width += 4*MARGIN;
    _contectLabelFrame.size.height += 4*MARGIN;

//cell的高度
    _cellHeigth = CGRectGetMaxY(_contectLabelFrame) + 2*MARGIN;

}

@end
