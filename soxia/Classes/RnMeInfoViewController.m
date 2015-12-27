//
//  RnMeInfoViewController.m
//  soxia
//
//  Created by ningning on 15/12/26.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnMeInfoViewController.h"
#import "RnSettingItem.h"
@interface RnMeInfoViewController ()

@end

@implementation RnMeInfoViewController

#pragma mark - 视图加载

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setInfoDatas];
    self.title = @"个人资料";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
//    self.tableView.separatorColor = [UIColor redColor];
}
- (void)setInfoDatas{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"me.plist" ofType:nil];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        return 60;
    }

    return 44;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *cellArray = self.datas[indexPath.section];
    RnSettingItem *item = [[RnSettingItem alloc] initWithDic:cellArray[indexPath.row]];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.detailTextLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:item.detail]];
        cell.detailTextLabel.text = @"            ";
        cell.detailTextLabel.layer.cornerRadius = 8.0f;
        cell.detailTextLabel.layer.masksToBounds = YES;
        
        }
   
}
@end
