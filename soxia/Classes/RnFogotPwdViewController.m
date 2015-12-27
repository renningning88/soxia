//
//  RnFogotPwdViewController.m
//  soxia
//
//  Created by ningning on 15/12/23.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnFogotPwdViewController.h"

@interface RnFogotPwdViewController ()

@end

@implementation RnFogotPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"设置新密码";
    self.saveBtn.enabled = NO;
    // Do any additional setup after loading the view from its nib.
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



- (IBAction)saveBtnClick:(RnButton *)sender {
    
    for (NSDictionary *dic in self.datas) {
        if ([self.accountFeild.text isEqualToString:[dic objectForKey:@"account"]]) {
            NSMutableDictionary *obj = [NSMutableDictionary dictionaryWithDictionary:dic];
            [obj setObject:self.pwdFeild.text forKey:@"pwd"];
            [self.datas removeObject:dic];
            [self.datas addObject:obj];
            
        }
       
    }
    if ([self.delegate respondsToSelector:@selector(fogotPwdViewController:didLoadDatas:)]) {
        [self.delegate fogotPwdViewController:self didLoadDatas:self.datas];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
