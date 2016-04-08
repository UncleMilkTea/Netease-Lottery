//
//  HYKGuideController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/13.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKGuideController.h"
#import "HYKCollectionViewCell.h"
#import "HYKTabBarControllerTableViewController.h"

@interface HYKGuideController ()<HYKCollectionViewCellDelegate,UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *secondImgView;
@property (nonatomic, weak) UIImageView *largeImgView;
@property (nonatomic, weak) UIImageView *smallImageView;
@property(strong,nonatomic) NSMutableArray *dataArray;

@end

@implementation HYKGuideController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    flowLayout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flowLayout];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.bounces = NO;
    
    [self.collectionView registerClass:[HYKCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setChildImageViews];
    
   
}

- (void)setChildImageViews {

    UIImageView *line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    
    line.x = -200;
    
    [self.collectionView addSubview:line];

    UIImageView *globe = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide1"]];
    
        [self.collectionView addSubview:globe];

    UIImageView *large = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    
    large.y = self.collectionView.height *.7;
   
    
    [self.collectionView addSubview:large];

    UIImageView *small = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    
    small.y = self.collectionView.height *.8;
    
    
    [self.collectionView addSubview:small];


    self.secondImgView = globe;
    self.largeImgView = large;
    self.smallImageView = small;


}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    // 偏移的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    int startX = 0;
    
    if (self.secondImgView.x < offsetX) {
        
        startX = self.secondImgView.x + scrollView.width * 2;
    } else {
        
        startX = self.secondImgView.x - scrollView.width * 2;
    }
    
    self.secondImgView.x = startX;
    self.largeImgView.x = startX;
    self.smallImageView.x = startX;
    
    // 计算页码
    int page = offsetX / scrollView.width;
    
    // 拼接图片名称
    NSString *secondName = [NSString stringWithFormat:@"guide%@", @(page + 1)];
    NSString *largeName = [NSString stringWithFormat:@"guideLargeText%@", @(page + 1)];
    NSString *smallName = [NSString stringWithFormat:@"guideSmallText%@", @(page + 1)];
    
    // 修改图片
    self.secondImgView.image = [UIImage imageNamed:secondName];
    self.largeImgView.image = [UIImage imageNamed:largeName];
    self.smallImageView.image = [UIImage imageNamed:smallName];
    
    
    // 直接让图片框移到屏幕上
    [UIView animateWithDuration:0.25 animations:^{
        
        self.secondImgView.x = offsetX;
        self.largeImgView.x = offsetX;
        self.smallImageView.x = offsetX;
        
    }];

}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HYKCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.delegate = self;
    
    cell.image = self.dataArray[indexPath.item];
    
    if (indexPath.item == 3) {
        
        cell.jumpBtn.hidden = NO;
        
    }else {
        
        cell.jumpBtn.hidden = YES;
    
    }
    
    return cell;
}


- (void)collectionViewCell:(HYKCollectionViewCell *)cell didFinishJumpBtn:(UIButton *)jumpBtn {

    HYKTabBarControllerTableViewController *tabBar = [[HYKTabBarControllerTableViewController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
}


- (NSMutableArray *)dataArray {

    if (_dataArray == nil) {
        
        _dataArray = [NSMutableArray array];
        
        for (int i=0; i<4; i++) {
            
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%dBackground",i+1]];
            
            [_dataArray  addObject:image];
        }
    }

    return _dataArray;
}

@end
