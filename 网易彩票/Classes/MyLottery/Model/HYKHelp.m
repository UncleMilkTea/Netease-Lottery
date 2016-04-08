//
//  HYKHelp.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKHelp.h"

@implementation HYKHelp
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.html  = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
