//
//  RnMeCellPushViewController.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnMeCellPushViewController.h"

@interface RnMeCellPushViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

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

- (NSArray *)yearDatas{
    if (_yearDatas) {
        return _yearDatas;
    }
    _yearDatas = @[@"1988",@"1989",@"1990",@"1991"];
    return _yearDatas;
}

- (NSArray *)monthDatas{

    if (_monthDatas) {
        return _monthDatas;
    }
    _monthDatas = @[@"1",@"2",@"3",@"4"];
    return _monthDatas;
}

- (NSArray *)dateDatas{
    if (_dateDatas) {
        return _dateDatas;
    }
    _dateDatas = @[@"01",@"02",@"03",@"04"];
    return _dateDatas;


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
            UIPickerView *picker = [[UIPickerView alloc] init];
            picker.dataSource = self;
            picker.delegate = self;
            self.picker = picker;
            [self.view addSubview:_picker];
//            self.cellFeild.text = ;
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
- (void)closeContent{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)saveContent{
    
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    [defult setObject:self.cellFeild.text forKey:self.title];
    [defult synchronize];
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)textChange{
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
    
}

#pragma mark - pickerview datasource and delegate
/** 列数*/
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
/** 每列个数*/

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    if (component == 0) {
        return self.yearDatas.count;
    }else if (component ==1){
        return self.monthDatas.count;
    }else{
        return self.dateDatas.count;
    }
}

// 每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    return self.view.frame.size.width/ 3;
}
// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
//    NSString *picYear = [NSString string];
//    NSString *picMon= [NSString string];
//    NSString *picDate= [NSString string];
//    picYear = [self.yearDatas objectAtIndex:row];
//    picMon = [self.monthDatas objectAtIndex:row];
//    picDate = [self.dateDatas objectAtIndex:row];
// 
//    self.cellFeild.text = [NSString stringWithFormat:@"%@--%@--%@",picYear,picMon,picDate];
}



//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.yearDatas objectAtIndex:row];
    } else if(component == 1){
        return [self.monthDatas objectAtIndex:row];
        
    }else{
        return [self.dateDatas objectAtIndex:row];
    
    }
}


@end
