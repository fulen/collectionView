//
//  QFMCollectionViewCell.m
//  MyProject
//
//  Created by fulen on 2016/10/28.
//  Copyright © 2016年 min. All rights reserved.
//

#import "QFMCollectionViewCell.h"



@implementation QFMCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [self.contentView addSubview:self.imageView];
    }
    return self;
}


//- (void)creatCell
//{
//    [self creatCellWithImageArray:self.imageArray];
//    
//}
//
//
//- (void)creatCellWithImageArray:(NSArray *)imageArray
//{
//    self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [self.contentView addSubview:self.imageV];
//}








- (void)awakeFromNib {
    [super awakeFromNib];

    
}

@end
