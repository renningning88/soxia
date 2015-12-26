
//
//  RnNavigationController.m
//  soxia
//
//  Created by ningning on 15/12/23.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnNavigationController.h"

@interface RnNavigationController ()

@end

@implementation RnNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];

    // 1 设置navigationbar的背景图片和字体颜色
    UINavigationBar *naviBar = [UINavigationBar appearance];
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [naviBar setTitleTextAttributes:attr];
    
    // 2 设置uibaritem 的字体及颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *attr2 = [NSMutableDictionary dictionary];
    attr2[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attr2[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:attr2 forState:UIControlStateNormal];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
