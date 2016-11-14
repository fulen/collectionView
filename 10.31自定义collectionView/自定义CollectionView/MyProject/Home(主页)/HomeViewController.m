//
//  ViewController.m
//  MyProject
//
//  Created by fulen on 2016/10/27.
//  Copyright © 2016年 min. All rights reserved.
//

#import "HomeViewController.h"
#import "QFMCollectionView.h"


@interface HomeViewController (){
    QFMCollectionView *collectionView;
    UICollectionView *MyCollectionView;
    NSArray *imageArray;

}



@end

@implementation HomeViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view.backgroundColor = [UIColor grayColor];
    imageArray = @[@"透明加号的副本",@"checkbox_bg_on@2x的副本",@"checkbox_bg@2x的副本",@"checkbox_bg@2x的副本",@"checkbox_bg@2x的副本",@"checkbox_bg@2x的副本"];
    CGRect rect = [[UIApplication sharedApplication] statusBarFrame];
    // 状态栏的高度：
    float statusheight =  rect.size.height;
    float navigationheight = self.navigationController.navigationBar.frame.size.height;
    NSLog(@"%f",statusheight+navigationheight);
    collectionView = [[QFMCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) ImageArray:imageArray itemOfLine:3 clickImageBlock:^(NSInteger index) {
        NSLog(@"点击的是第%ld个",(long)index);
    }];
    [self.view addSubview:collectionView];

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
