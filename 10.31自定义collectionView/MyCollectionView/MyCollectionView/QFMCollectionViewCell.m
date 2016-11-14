//
//  QFMCollectionViewCell.m
//  MyCollectionView
//
//  Created by fulen on 2016/11/2.
//  Copyright © 2016年 min. All rights reserved.
//

#import "QFMCollectionViewCell.h"

@implementation QFMCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        self.imageView.frame = self.bounds;
    }
    return self;
}

-(void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}


@end
