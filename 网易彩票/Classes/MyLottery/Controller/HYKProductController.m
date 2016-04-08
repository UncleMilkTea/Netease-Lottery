                //
//  HYKProductController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKProductController.h"
#import "HYKProduct.h"
#import "HYKProductCell.h"

@interface HYKProductController ()

@property (nonatomic,strong) NSArray *productArray;

@end

@implementation HYKProductController

static NSString * const reuseIdentifier = @"Cell";

//懒加载
- (NSArray *)productArray {
    
    if (nil == _productArray) {
        
        NSData *tempData = [NSData dataWithContentsOfFile:
                              
                              [[NSBundle mainBundle]
                               
                               pathForResource:@"products.json"
                               
                               ofType:nil]];
        
        
        
        NSArray *data = [NSJSONSerialization JSONObjectWithData:tempData options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (NSDictionary *object in data) {
            
            HYKProduct *model= [HYKProduct modelWithDict:object];
            
            [mutableArray addObject:model];
        }
        
        _productArray = mutableArray;
    }
    
    return _productArray;
}

- (instancetype)init {

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.itemSize = CGSizeMake(80, 80);
    
    flowLayout.minimumInteritemSpacing = 0;
    
    flowLayout.minimumLineSpacing = 10;
    
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 0, 0, 0);

    return [super initWithCollectionViewLayout:flowLayout];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"HYKProductCell" bundle:nil];
    
    // Register cell classes
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    
    return self.productArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    HYKProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.product = self.productArray[indexPath.item];
    
    return cell;
}



#pragma mark - 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取选中的模型
    HYKProduct *selectProduct = self.productArray[indexPath.item];
    
    
    HYKLog(@"%@",selectProduct.title);
    
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@",selectProduct.customUrl,selectProduct.ID];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    
    if ([app canOpenURL:url]) {
        
        [app openURL:url];
    }else {
    
        [app openURL:[NSURL URLWithString:selectProduct.url]];
    
    }
    
}


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
