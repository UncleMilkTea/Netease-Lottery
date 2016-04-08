//
//  QQChatCellTableViewCell.h
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QQChatFrameModel;
@interface QQChatCell : UITableViewCell
/**
 *  创建一个对外的QQChatFrameModel的属性
 */
@property(strong,nonatomic) QQChatFrameModel *qqChatFrameModel;

@end
