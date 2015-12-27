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
    [self setDeviceDatas];
    self.title = @"关于App";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
}
- (void)setDeviceDatas{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"aboutApp.plist" ofType:nil];
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
