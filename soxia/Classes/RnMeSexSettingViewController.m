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
-(NSMutableArray *)ys{
    if (_ys) {
        return _ys;
    }
   _ys = [NSMutableArray array];

    return _ys;
}

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
    NSString *y = [NSString stringWithFormat:@"%ld",indexPath.row];
    // 1 创建cell
    static NSString *ID = @"sexcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    // 2 设置cell
     cell.textLabel.text = self.cellDatas[indexPath.row];
    if ([self.title isEqualToString:@"性别"]) {
       
        NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
        NSString *y = [defult objectForKey:self.cellDatas[0]];
        
        if (indexPath.row ==[y integerValue]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else{
        NSMutableString *mstr = [NSMutableString string];
        for (int i = 0; i < self.cellDatas.count; i++) {
            mstr = [NSMutableString stringWithFormat:@"%@%@",mstr,self.cellDatas[i]];
        }

        NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
        NSArray *ys = [defult objectForKey:mstr];
        self.ys = [NSMutableArray arrayWithArray:ys];
        if ([ys containsObject:y]) {
             cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    
    
    }
   
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *y = [NSString stringWithFormat:@"%ld",indexPath.row];
    NSMutableString *mstr = [NSMutableString string];
        if ([self.title isEqualToString:@"性别"]) {// 单选
       
        // 0 上一个被选中的对号去掉
        UITableViewCell *seleCell = [tableView cellForRowAtIndexPath:self.seleIndexpath];
        seleCell.accessoryType = UITableViewCellAccessoryNone;
        
        
        // 2 有对号出现
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.seleIndexpath = indexPath;
        
               NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
        
        [defult setObject:y forKey: self.cellDatas[0]];
        [defult synchronize];
        [self.navigationController popViewControllerAnimated:YES];
    }else{// 多选
    
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType ==UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [self.ys removeObject:y];
            

        }else if (cell.accessoryType == UITableViewCellAccessoryNone){
            
        cell.accessoryType = UITableViewCellAccessoryCheckmark;

            [self.ys addObject:y];
        }
       
        for (int i = 0; i < self.cellDatas.count; i++) {
            mstr = [NSMutableString stringWithFormat:@"%@%@",mstr,self.cellDatas[i]];
            
        }
        NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
        [defult setObject:self.ys forKey:mstr];
        [defult synchronize];
    
    
    }
    

    
}


@end
