//
//  QQChatFrameModel.h
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class QQChatModel;
@interface QQChatFrameModel : NSObject
/**
 * 头像的frame
 */
@property (nonatomic,assign) CGRect iconLabelFrame;
/**
 *  时间的frame
 */
@property (nonatomic,assign) CGRect timeLabelFrame;
/**
*  聊天框frame
*/
@property (nonatomic,assign) CGRect contectLabelFrame;
/**
 *  每个cell的高度
 */

@property (nonatomic,assign) CGFloat cellHeigth;
/**
*  引入QQChatModel
*/
@property (nonatomic,strong) QQChatModel *qqChatModel;




@end
