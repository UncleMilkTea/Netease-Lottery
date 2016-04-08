//
//  HYKProduct.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKProduct.h"

@implementation HYKProduct
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.ID = dict[@"id"];
        self.customUrl = dict[@"customUrl"];
        
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
