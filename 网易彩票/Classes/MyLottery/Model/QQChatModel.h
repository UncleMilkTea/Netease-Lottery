//
//  QQChatModel.h
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,QQChatTye) {
   QQChatTyeOther,
    QQChatTyeMe
};


@interface QQChatModel : NSObject
@property(copy,nonatomic) NSString *time;
@property(copy,nonatomic) NSString *text;
@property(assign,nonatomic) QQChatTye type;
@property(assign,nonatomic,getter=isHiddenLabel) BOOL hidenLabel;
- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)QQChatModel:(NSDictionary *)dic;
@end
