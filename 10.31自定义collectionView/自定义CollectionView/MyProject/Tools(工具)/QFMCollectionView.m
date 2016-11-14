//
//  QFMCollectionView.m
//  MyProject
//
//  Created by fulen on 2016/10/27.
//  Copyright © 2016年 min. All rights reserved.


#import "QFMCollectionView.h"
#import "QFMCollectionViewCell.h"

#define itemWidth (SCREEN_WIDTH-MINIMULIINESPACING*(self.itemOfLine+1))/self.itemOfLine

@implementation QFMCollectionView

- (instancetype)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray itemOfLine:(NSInteger)item clickImageBlock:(selectImageBlock)selectImageBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
//        self.automaticallyAdjustsScrollViewInsets = YES;
        self.block = selectImageBlock;
        self.imageArray = imageArray;
        self.itemOfLine = item;
        [self addSubview:self.collectionView];
    }
    return self;
}


#pragma mark ---懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
//        self.automaticallyAdjustsScrollViewInsets = YES;
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = MINIMULIINESPACING;
        flowLayout.minimumInteritemSpacing = MINIMUMINTERITEMSPACING;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 9, 10, 10);
        CGFloat collectionViewHeight;
        if (self.imageArray.count%self.itemOfLine>0) {
            collectionViewHeight = 10+(itemWidth+10)*(self.imageArray.count/self.itemOfLine+1);
        }else{
            collectionViewHeight = 10+(itemWidth+10)*self.imageArray.count/self.itemOfLine;
        }
        NSLog(@"%f",collectionViewHeight);
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, collectionViewHeight) collectionViewLayout:flowLayout];
        NSLog(@"%@",NSStringFromCGRect(_collectionView.frame));
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        _collectionView.backgroundColor = [UIColor yellowColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}


#pragma mark --- collectionView delegate ---

// 返回多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

// 返回几个section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 创建cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    //    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}


// 点击item调用方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.block(indexPath.row);
}




@end



