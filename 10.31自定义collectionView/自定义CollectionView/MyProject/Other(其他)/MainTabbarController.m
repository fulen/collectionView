//
//  MainTabbarController.m
//  MyProject
//
//  Created by fulen on 2016/10/27.
//  Copyright © 2016年 min. All rights reserved.
//

#import "MainTabbarController.h"
#import "SettingViewController.h"
#import "HomeViewController.h"


@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatViewControllers];
    
}

- (void)creatViewControllers
{
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    home.title = @"主页";
    
    SettingViewController *setting = [[SettingViewController alloc] init];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:setting];
    setting.title = @"设置";
    
    self.viewControllers = @[homeNav,settingNav];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
