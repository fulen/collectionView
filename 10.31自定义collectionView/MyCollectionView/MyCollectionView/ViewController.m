//
//  ViewController.m
//  MyCollectionView
//
//  Created by fulen on 2016/11/1.
//  Copyright © 2016年 min. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionView.h"

@interface ViewController ()
{
    MyCollectionView *collectionView;
    NSArray *imageArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义CollectionView";
    
    self.view.backgroundColor = [UIColor grayColor];
    imageArray = @[@"4",@"2",@"3",@"4",@"1",@"3"];
    
    /**
     创建自定义collectionView
     
     @param imageArray 传入的图片数组
     @param item 每行显示几个item
     @param selectImageBlock 点击事件的回调方法
     @return 返回
     */
//    self.view.frame = CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT-64);
    self.edgesForExtendedLayout = UIRectEdgeNone; //view不需要拓展到整个屏幕
    collectionView = [[MyCollectionView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) ImageArray:imageArray itemOfLine:3 clickImageBlock:^(NSInteger index) {
        NSLog(@"点击的是第%ld个",(long)index);
    }];
    [self.view addSubview:collectionView];

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
