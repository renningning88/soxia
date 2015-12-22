//
//  RnLoginViewController.m
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnLoginViewController.h"

@interface RnLoginViewController ()

@end

@implementation RnLoginViewController
#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn.enabled = NO;
    // 1 隐藏navigationbar
    [self.navigationController setNavigationBarHidden:YES];
    
    // 2 设置头像
    self.iconView.layer.cornerRadius = 10.0f;
    self.iconView.layer.masksToBounds = YES;
    
    // 3 监听用户名和密码
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.accountFeild];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwdFeild];
    // 4 读取上一次的用户名和密码
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    self.accountFeild.text = [defult objectForKey:RnAccountKey];
    self.pwdFeild.text = [defult objectForKey:RnPwdKey];
    
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)textChange{

    self.loginBtn.enabled = (self.accountFeild.text.length > 0 && self.pwdFeild.text.length > 0);

}




- (IBAction)fogotPwdBtnClick:(id)sender {
}

- (IBAction)registerBtnClick:(id)sender {
}
#pragma mark - 登录
- (IBAction)loginBtnClick:(id)sender {
    //    [MBProgressHUD showMessage:@"正在登录，请稍候"];
    //        // 1 网络请求
    //    NSString *urlStr = @"http://192.168.1.100/api/list.php";
    //
    //    [[ApiManager showManager] POST:urlStr parameters:nil success:^(NSDictionary *jsonDic) {
    //        // 1 网络请求成功
    //        [MBProgressHUD hideHUD];
    //        NSArray *dicArray = [jsonDic objectForKey:@"results"];
    //        [dicArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //            if ( [self.acountText.text isEqualToString:[obj objectForKey:@"acount"]]&& [self.pwdText.text isEqualToString:[obj objectForKey:@"pwd"]]) {
    //                [self.iconView sd_setImageWithURL:[NSURL URLWithString:[obj objectForKey:@"icon"]]];
    //              // 2 正确后进行push 操作
    //                [self performSegueWithIdentifier:@"login" sender:nil];
    //                NSUserDefaults *defults = [NSUserDefaults standardUserDefaults];
    //                [defults setValue:self.acountText.text forKey:RnAcountKey];
    //                [defults setValue:self.pwdText.text forKey:RnPwdKey];
    //                [defults synchronize];
    //            }
    //        }];
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //        // 2 网络请求失败
    //        [MBProgressHUD showError:@"网络出现错误！"];
    //    }];
    [self performSegueWithIdentifier:@"login" sender:nil];
    
    
    
}
@end
