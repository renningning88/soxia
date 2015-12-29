//
//  RnPreferenceSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnPreferenceSettingViewController.h"
#import "RnSettingItem.h"
@interface RnPreferenceSettingViewController ()

@end

@implementation RnPreferenceSettingViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpDatas:@"preference.plist"];
    self.title = @"偏好设置";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
    //    self.tableView.separatorColor = [UIColor redColor];
}


@end
