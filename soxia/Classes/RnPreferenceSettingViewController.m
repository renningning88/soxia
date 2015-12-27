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
    [self setPreferenceDatas];
    self.title = @"偏好设置";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
    //    self.tableView.separatorColor = [UIColor redColor];
}
- (void)setPreferenceDatas{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"preference.plist" ofType:nil];
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
