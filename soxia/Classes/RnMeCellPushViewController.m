//
//  RnMeCellPushViewController.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnMeCellPushViewController.h"
#import "RnSettingItemCell.h"
#import "RnSettingItem.h"
#import "RnBasicViewController.h"
@interface RnMeCellPushViewController ()<UITableViewDelegate>

@end

@implementation RnMeCellPushViewController
#pragma mark - 懒加载
- (UITextField *)cellFeild{
    if (_cellFeild) {
        return _cellFeild;
    }
    _cellFeild = [[UITextField alloc] init];
    _cellFeild.borderStyle =  UITextBorderStyleNone;
    return _cellFeild;
}

-(UIView *)cellView{
    if (_cellView) {
        return _cellView;
    }
    _cellView = [[UIView alloc] init];
    _cellView.backgroundColor = [UIColor whiteColor];
    return _cellView;

}


#pragma mark - init
- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        
        self.title = title;
        self.view.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1];
       
        // 1 添加cell并设置
        [self.view addSubview:self.cellView];
        [self.cellView addSubview:self.cellFeild];
        if ([self.title isEqualToString:@"生日"]) {
            
            UIDatePicker *picker = [[UIDatePicker alloc] init];
            picker.datePickerMode = UIDatePickerModeDate;
            picker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            [picker addTarget: self action: @selector(onDatePickerChanged:) forControlEvents:UIControlEventValueChanged];
            self.picker = picker;
            [self.view addSubview:_picker];

        }else if ([self.title isEqualToString:@"学校"]){
            RnBasicView *schoolView = [RnBasicView basicWithName:@"school.plist"];
            schoolView.tableView.delegate = self;
            self.schoolDatas = schoolView.datas;
            self.schoolView = schoolView;
            [self.view addSubview:self.schoolView];
        }
        [self.cellView makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(64.0f);
            make.width.mas_equalTo(self.view);
            make.centerX.mas_equalTo(self.view);
            make.height.mas_equalTo(44.0f);
        }];
        [self.cellFeild makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellView).offset(10.0f);
            make.left.mas_equalTo(self.cellView).offset(10.0f);
            make.right.mas_equalTo(self.cellView).offset(-10.0f);
            make.centerX.mas_equalTo(self.cellView);
        }];
        
        [self.picker makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellView.bottom).offset(60.0f);
            make.width.mas_equalTo(self.view);
            make.centerX.mas_equalTo(self.view);
            make.height.mas_equalTo(200.0f);
        }];
        [self.schoolView makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cellView.bottom).offset(30.0f);
            make.width.mas_equalTo(self.view);
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view.bottom);
        }];
        // 2 添加按钮并设置
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(closeContent)];
        self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveContent)];
        self.navigationItem.rightBarButtonItem.enabled = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.cellFeild];
        // 3 显示
        NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
        self.cellFeild.text = [defult objectForKey:self.title];
        
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self.schoolView.tableView reloadData];

}
/** 取消按钮*/
- (void)closeContent{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/** 保存按钮*/
- (void)saveContent{
    
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    [defult setObject:self.cellFeild.text forKey:self.title];
    [defult synchronize];
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)textChange{
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
}
/** datepicker 改变*/
- (void)onDatePickerChanged:(UIDatePicker *)picker{
    self.navigationItem.rightBarButtonItem.enabled = YES;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy--MM--dd"];
   
    self.cellFeild.text = [dateFormatter stringFromDate:self.picker.date];

}

#pragma mark - cell

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
       self.navigationItem.rightBarButtonItem.enabled = YES; 
// 1 取模型
    NSDictionary *dic = self.schoolDatas[indexPath.row];
    NSArray *cellArray = [dic objectForKey:@"datas"];
    RnBasicViewController *cellvc = [[RnBasicViewController alloc] init];
    RnBasicView *bView = [[RnBasicView alloc] initWithDatas:cellArray];
    cellvc.bView = bView;
    cellvc.datas = cellArray;
    [self.navigationController pushViewController:cellvc animated:YES];
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    NSString *schoolId = [defult objectForKey:RnSchoolID];
    NSDictionary *obj = cellArray[[schoolId intValue]];
    self.cellFeild.text = [NSString stringWithFormat:@"%@-%@",[dic objectForKey:@"title"],[obj objectForKey:@"title"]];
    
}

@end
