//
//  HYKSelectNumberController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKSelectNumberController.h"
@interface HYKSelectNumberController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImage;

@end
@implementation HYKSelectNumberController


- (void)viewDidLoad {

    [super viewDidLoad];
    
    _lightImage.animationImages = @[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]];
    
    _lightImage.animationDuration = 1;
    
    _lightImage.animationRepeatCount = 0;
    
    [_lightImage startAnimating];
    
    
}



@end
