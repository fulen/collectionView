//
//  QFMCollectionView.h
//  MyProject
//
//  Created by fulen on 2016/10/27.
//  Copyright © 2016年 min. All rights reserved.

#import <UIKit/UIKit.h>

typedef void(^selectImageBlock)(NSInteger index);

@interface QFMCollectionView : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,strong)NSArray *imageArray;
@property (nonatomic ,strong)UICollectionView *collectionView;
@property (nonatomic ,assign)NSInteger itemOfLine;


//block用于回调
@property (nonatomic ,copy)selectImageBlock block;

/**
 创建自定义collectionView
 
 @param imageArray 传入的图片数组
 @param item 每行显示几个item
 @param selectImageBlock 点击事件的回调方法
 @return 返回
 */
- (instancetype)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray itemOfLine:(NSInteger)item clickImageBlock:(selectImageBlock)selectImageBlock;

@end
