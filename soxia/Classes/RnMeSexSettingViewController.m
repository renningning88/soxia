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


- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    self.title = @"性别";
   
    
}
- (instancetype)initWithStyle:(UITableViewStyle)style{

    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1 创建cell
    static NSString *ID = @"sexcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    // 2 设置cell
    NSArray *cellDatas = @[@"男",@"女"];
    cell.textLabel.text = cellDatas[indexPath.row];
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    NSString *x = [defult objectForKey:RnOldPxKeyX];
    NSString *y = [defult objectForKey:RnOldPxKeyY];
    
    if (indexPath.row ==[y integerValue]&& indexPath.section ==[x integerValue]) {
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
    
    
    NSString *x = [NSString stringWithFormat:@"%ld",indexPath.section];
    NSString *y = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    [defult setObject:x forKey:RnOldPxKeyX];
    [defult setObject:y forKey:RnOldPxKeyY];
    [defult synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
