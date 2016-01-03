//
//  RnBasicTableView.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnBasicView.h"
#import "RnBaicTableViewCell.h"
@implementation RnBasicView
#pragma mark - 懒加载

-(UITableView *)tableView{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.separatorColor = [UIColor grayColor];
    _tableView.dataSource = self;
    return _tableView;

}
#pragma mark - 创建
-(instancetype)initWithDatas:(NSArray *)datas{

    if (self = [super init]) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
//        NSArray *sdatas = [NSArray arrayWithContentsOfFile:path];
        self.datas = datas;
        [self addSubview:self.tableView];
        [self.tableView makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.width.mas_equalTo(self);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(self);
        }];
        
    }


    return self;
}

+(instancetype)basicWithName:(NSString *)plistName{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSArray *pathDatas = [NSArray arrayWithContentsOfFile:path];

    return [[self alloc] initWithDatas:pathDatas];

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


@end
