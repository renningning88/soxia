//
//  RnMeSexSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnMeSexSettingViewController.h"

@interface RnMeSexSettingViewController ()

@end

@implementation RnMeSexSettingViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];

}

- (instancetype)initWithDatas:(NSArray *)cellDatas{
    if (self = [super init]) {
        self.cellDatas = cellDatas;
    }

    return self;
}
- (instancetype)initWithStyle:(UITableViewStyle)style{

    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // 1 创建cell
    static NSString *ID = @"sexcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    // 2 设置cell
    
    cell.textLabel.text = self.cellDatas[indexPath.row];
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    NSString *y = [defult objectForKey:self.cellDatas[0]];
    
    if (indexPath.row ==[y integerValue]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 0 上一个被选中的对号去掉
    UITableViewCell *seleCell = [tableView cellForRowAtIndexPath:self.seleIndexpath];
    seleCell.accessoryType = UITableViewCellAccessoryNone;

    
    // 2 有对号出现
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.seleIndexpath = indexPath;

    NSString *y = [NSString stringWithFormat:@"%ld",indexPath.row];
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];

    [defult setObject:y forKey: self.cellDatas[0]];
    [defult synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
