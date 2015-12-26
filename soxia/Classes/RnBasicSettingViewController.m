//
//  RnBasicSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnBasicSettingViewController.h"
#import "RnSettingItem.h"
#import "RnSettingItemCell.h"
@interface RnBasicSettingViewController ()

@end

@implementation RnBasicSettingViewController
#pragma mark - 懒加载
- (NSMutableArray *)datas{
    if (_datas) {
        return _datas;
    }

    _datas = [NSMutableArray array];

return _datas;
}

#pragma mark - 分组
- (instancetype)initWithStyle:(UITableViewStyle)style{
    NSLog(@" UITableViewStyleGrouped ");
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.datas[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1 创建cell
    RnSettingItemCell *cell = [RnSettingItemCell cellWithTableView:tableView];
    
    // 2 赋值
    // 2.1 取模型
    NSArray *cellArray = self.datas[indexPath.section];
    RnSettingItem *item = [[RnSettingItem alloc ]initWithDic:cellArray[indexPath.row]];
//    NSLog(@"%@",item);
    cell.item = item;
        return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *cellArray = self.datas[indexPath.section];
    RnSettingItem *item = cellArray[indexPath.row];
    if ([item.type isEqualToString:@"ArrowItem"]) {
        id vc  = [[NSClassFromString(item.vcClass) alloc] init ];
        [self.navigationController pushViewController:vc animated:YES];
    }




}
@end
