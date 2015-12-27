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
    [self setDeviceDatas];
    self.title = @"设备设置";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
}

- (void)setDeviceDatas{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"device.plist" ofType:nil];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSArray *arr in dicArray) {
        NSMutableArray *dataArray = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            RnSettingItem *item = [[RnSettingItem alloc] initWithDic:obj];
            [dataArray addObject:item];
        }];
        [self.datas addObject:arr];
    }
    
}



@end
