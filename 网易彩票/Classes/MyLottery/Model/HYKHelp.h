//
//  HYKHelp.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYKHelp : NSObject
@property(copy,nonatomic) NSString *title;

@property(copy,nonatomic) NSString *html;

@property(copy,nonatomic) NSString *ID;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
