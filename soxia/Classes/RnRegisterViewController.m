//
//  RnRegisterViewController.m
//  soxia
//
//  Created by ningning on 15/12/23.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnRegisterViewController.h"
#import "RnLoginViewController.h"
#import "AppDelegate.h"
@interface RnRegisterViewController ()

@end

@implementation RnRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.saveBtn.enabled = NO;
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"注册";
    self.iconView.layer.cornerRadius = 20.0f;
    self.iconView.layer.masksToBounds = YES;
    
// 监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountFeild];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdFeild];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)textChange{

    self.saveBtn.enabled = (self.accountFeild.text.length > 0 && self.pwdFeild.text.length > 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 待询问===========================传递数据问题========================================
- (IBAction)saveBtnClick:(RnButton *)sender {
    // 1 看用户名是否存在
        for (NSDictionary *dic in self.datas) {
            if ([self.accountFeild.text isEqualToString:[dic objectForKey:@"account"]]) {
                self.warnFeild.hidden = NO;
                return;
                
            }
        }
    NSMutableDictionary *obj = [NSMutableDictionary dictionary];
    [obj setObject:self.accountFeild.text forKey:@"account"];
//    [obj setObject:self.mailFeild.text forKey:@"mail"];
    [obj setObject:self.pwdFeild.text forKey:@"pwd"];
    [obj setObject:self.iconView.image forKey:@"icon"];
    [self.datas addObject:obj];
    // 3 隐藏警告
    self.warnFeild.hidden = YES;
    
    // 4 通知代理
    if ([self.delegate respondsToSelector:@selector(registerViewController:didLoadDatas:)]) {
        [self.delegate registerViewController:self didLoadDatas:self.datas];
    }

    // 5 返回登录
    [self.navigationController popViewControllerAnimated:YES];
    

    
}


@end
