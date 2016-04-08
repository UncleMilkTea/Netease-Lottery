//
//  HYKProduct.h
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYKProduct : NSObject
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *customUrl;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
