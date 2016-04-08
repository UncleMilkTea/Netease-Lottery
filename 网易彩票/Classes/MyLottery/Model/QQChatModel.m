//
//  QQChatModel.m
//  QQ聊天
//
//  Created by 侯玉昆 on 15/12/18.
//  Copyright © 2015年 侯玉昆. All rights reserved.
//

#import "QQChatModel.h"

@implementation QQChatModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)QQChatModel:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
@end
