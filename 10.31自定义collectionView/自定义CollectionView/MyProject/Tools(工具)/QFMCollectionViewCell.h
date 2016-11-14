//
//  QFMCollectionViewCell.h
//  MyProject
//
//  Created by fulen on 2016/10/28.
//  Copyright © 2016年 min. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface QFMCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewXib;


@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) NSArray *imageArray;

//- (void)creatCellWithImageArray:(NSArray *)imageArray;


@end
