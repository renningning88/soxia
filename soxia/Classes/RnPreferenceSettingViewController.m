//
//  RnPreferenceSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnPreferenceSettingViewController.h"
#import "RnSettingItem.h"
#import "RnMeSexSettingViewController.h"
#import "RnSettingItemCell.h"
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RnSettingItemCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSArray *datas = @[@[@"曲风偏好",@"歌手偏好"],@[@"国内",@"财经",@"娱乐",@"体育",@"科技"],@[@"荤段子",@"冷笑话",@"爆笑"],@[@"动漫",@"NBA",@"聊天"]];

    RnMeSexSettingViewController *vc = [[RnMeSexSettingViewController alloc] initWithDatas:datas[indexPath.section]];
    vc.title =cell.textLabel.text;
    [self.navigationController pushViewController:vc animated:YES];

}


@end
