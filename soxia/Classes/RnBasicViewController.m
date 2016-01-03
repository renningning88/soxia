//
//  RnBasicTableViewController.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnBasicViewController.h"
#import "RnBasicView.h"
#import "RnBaicTableViewCell.h"

@interface RnBasicViewController ()<UITableViewDelegate>

@end

@implementation RnBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bView.frame = self.view.frame;
    self.bView.tableView.delegate = self;
    [self.view addSubview:self.bView];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    NSString *schoolId = [NSString stringWithFormat:@"%ld",indexPath.row];
    [defult setObject:schoolId forKey:RnSchoolID];
    [defult synchronize];
    NSDictionary *dic = self.datas[indexPath.row];
    if ([[dic objectForKey:@"type"] isEqualToString:@"ArrowItem"]) {
        RnBasicViewController *vc = [[RnBasicViewController alloc] init];
        RnBasicView *bView = [[RnBasicView alloc] initWithDatas:[dic objectForKey:@"datas"]];
        bView.frame = self.view.frame;
        vc.bView = bView;
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([[dic objectForKey:@"type"] isEqualToString:@""]){
        [self.navigationController popViewControllerAnimated:YES];
    
    }
}


@end
