//
//  RnAboutAppSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnAboutAppSettingViewController.h"
#import "RnSettingItem.h"
@interface RnAboutAppSettingViewController ()

@end

@implementation RnAboutAppSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDatas:@"aboutApp.plist"];
    self.title = @"关于App";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
}




@end
