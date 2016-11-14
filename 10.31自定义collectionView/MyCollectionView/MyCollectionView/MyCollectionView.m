//
//  MyCollectionView.m
//  MyCollectionView
//
//  Created by fulen on 2016/11/1.
//  Copyright © 2016年 min. All rights reserved.
//

#import "MyCollectionView.h"
#import "QFMCollectionViewCell.h"


#define itemWidth (SCREEN_WIDTH-MINIMULIINESPACING*(self.itemOfLine+1))/self.itemOfLine


@implementation MyCollectionView


- (instancetype)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray itemOfLine:(NSInteger)item clickImageBlock:(selectImageBlock)selectImageBlock
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor cyanColor];
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
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = MINIMULIINESPACING;
        flowLayout.minimumInteritemSpacing = MINIMUMINTERITEMSPACING;
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        // 状态栏的高度：
//        float statusheight =  rect.size.height;
//        float navigationheight = self.navigationController.navigationBar.frame.size.height;
        
        // 有导航栏的情况下flowLayout.sectionInset = UIEdgeInsetsMake(-54, 9, 10, 10);
        // 没有导航栏的情况下flowLayout.sectionInset = UIEdgeInsetsMake(10, 9, 10, 10);        
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 9, 10, 10);
        
        CGFloat collectionViewHeight;
        if (self.imageArray.count%self.itemOfLine>0) {
            collectionViewHeight = 10+(itemWidth+10)*(self.imageArray.count/self.itemOfLine+1);
        }else{
            collectionViewHeight = 10+(itemWidth+10)*self.imageArray.count/self.itemOfLine;
        }
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, collectionViewHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor yellowColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[QFMCollectionViewCell class] forCellWithReuseIdentifier:@"QFMCollectionViewCell"];
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
    static NSString * CellIdentifier = @"QFMCollectionViewCell";
    QFMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    //    cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.imageName = self.imageArray[indexPath.row];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}


// 点击item调用方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.block(indexPath.row);
}




@end
