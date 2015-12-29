//
//  plist> RnDeviceSeetingViewController.m
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnDeviceSettingViewController.h"
#import "RnSettingItem.h"
@interface RnDeviceSettingViewController ()

@end

@implementation RnDeviceSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDatas:@"device.plist"];
    self.title = @"设备设置";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
}

@end
