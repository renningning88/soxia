//
//  RnBasicTableViewController.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnBasicViewController.h"
#import "RnBaicTableViewCell.h"
@interface RnBasicViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RnBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 懒加载
- (UITableView *)tableView{
        if (_tableView) {
            return _tableView;
        }
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        return _tableView;

}
#pragma mark - 创建
-(instancetype)initWithDatas:(NSArray *)datas{
    
    if (self = [super init]) {
        
        self.datas = datas;
        [self.view addSubview:self.tableView];
        [self.tableView makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view);
            make.width.mas_equalTo(self.view);
            make.centerX.mas_equalTo(self.view);
            make.height.mas_equalTo(self.view);
        }];
        
    }
    
    
    return self;
}
#pragma mark - tableview 代理和数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 创建cell
    RnBaicTableViewCell *cell = [RnBaicTableViewCell cellWithTableView:tableView];
    
    // 2 设置cell
    NSDictionary *dic = self.datas[indexPath.row];
    [cell setCellContent:dic];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1 取得数据
    NSDictionary *dic = self.datas[indexPath.row];
    if ([[dic objectForKey:@"type"] isEqualToString:@"ArrowItem"]) {
        NSArray *schools = [dic objectForKey:@"schools"];
        
        RnBasicViewController *vc = [[RnBasicViewController alloc] initWithDatas:schools];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
    
    
    
    }
    
}

@end
