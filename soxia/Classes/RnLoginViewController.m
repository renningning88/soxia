//
//  RnLoginViewController.m
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnLoginViewController.h"
#import "RnRegisterViewController.h"
#import "RnFogotPwdViewController.h"
#define ANIMATION_DURATION 0.3f
@interface RnLoginViewController ()<RnRegisterViewControllerDelegate,RnFogotPwdViewControllerDelegate>

@end

@implementation RnLoginViewController
#pragma mark - 数据加载

- (NSMutableArray *)datas{
    if (_datas) {
        return _datas;
    }
    // 此处应为建立表格  并在此处读取表格
    NSDictionary *account1  = [NSDictionary dictionaryWithObjectsAndKeys:@"109327402",@"account",@"123456",@"pwd",@"1.jpeg",@"icon", nil];
    NSDictionary *account2=[NSDictionary dictionaryWithObjectsAndKeys:@"1298312",@"account",@"29843223",@"pwd",@"2.jpeg",@"icon", nil];
    self.datas =[NSMutableArray arrayWithObjects:account1,account2,nil];
    return _datas;
}


#pragma mark - 视图加载
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"register --login self.datas ====%@",self.datas);
    
    self.title = @"登录";
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
//    self.iconView.image = [defult objectForKey:RnIconKey];
    if (defult) {
        self.loginBtn.enabled = YES;
    }
    
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void)textChange{

    self.loginBtn.enabled = (self.accountFeild.text.length > 0 && self.pwdFeild.text.length > 0);
   
}
#pragma mark - registerView 的代理
- (void)registerViewController:(RnRegisterViewController *)registerViewController didLoadDatas:(NSMutableArray *)datas{
    // 1 传递数据
    self.datas = datas;
 

}

#pragma mark - fogotpwd代理
- (void)fogotPwdViewController:(RnFogotPwdViewController *)fogotPwdViewController didLoadDatas:(NSMutableArray *)datas{
// 1 传递数据
    self.datas = datas;

}
#pragma mark - button 操作
/** 忘记密码*************************/
- (IBAction)fogotPwdBtnClick:(id)sender {
    RnFogotPwdViewController *vc = [[RnFogotPwdViewController alloc] init];
    vc.datas = self.datas;
    
    [self performSegueWithIdentifier:@"fogotpwd" sender:nil];
}


/** 注册新用户 ************************/
- (IBAction)registerBtnClick:(id)sender {

    [self performSegueWithIdentifier:@"register" sender:nil];
//    NSLog(@"login---register datas%@",vc.datas);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"register"]) {
        RnRegisterViewController *vc = segue.destinationViewController;
        vc.datas = self.datas;
        vc.delegate = self;
        
    }else if ([segue.identifier isEqualToString:@"fogotpwd"]){
    
        RnFogotPwdViewController *vc = segue.destinationViewController;
        vc.datas = self.datas;
        vc.delegate = self;
    }


}
/** 登录==========================================网络请求未完成*/
- (IBAction)loginBtnClick:(id)sender {
    // 1 判断用户名和密码是否正确
    // 此处应为网络请求；
    [self.datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([self.accountFeild.text isEqualToString:[obj objectForKey:@"account"]]&&[self.pwdFeild.text isEqualToString:[obj objectForKey:@"pwd"]]) {
            NSUserDefaults *defults = [NSUserDefaults standardUserDefaults];
            [defults setObject:self.accountFeild.text forKey:RnAccountKey];
            [defults setObject:self.pwdFeild.text forKey:RnPwdKey];
//            [defults setObject:self.iconView.image forKey:RnIconKey];
            [defults synchronize];
            [self performSegueWithIdentifier:@"login" sender:nil];
            
        }else if (![self.accountFeild.text isEqualToString:[obj objectForKey:@"account"]] &&[self.pwdFeild.text isEqualToString:[obj objectForKey:@"pwd"]]){
        
            [MBProgressHUD showError:@"用户名不存在"];
            
        
        }else if ([self.accountFeild.text isEqualToString:[obj objectForKey:@"account"]] &&![self.pwdFeild.text isEqualToString:[obj objectForKey:@"pwd"]]){
            [MBProgressHUD showError:@"密码不正确"];
           
        }
    }];
    
    
}

/** 下拉 用户*/
- (IBAction)dropBtnClick:(id)sender {
    [self reloadAccountBox];
    [self.dropBtn setImage:[UIImage imageNamed:@"login_textfield_more_flip.png"] forState:UIControlStateSelected];
    if (self.dropBtn.selected == YES) {
        [self hideAccountBox];
        
    }else{
        [self showAccountBox];
    
    }
    
    
}
/** 下拉 */
- (void)showAccountBox{
    self.dropBtn.selected = YES;
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:nil];
    [move setFromValue:[NSValue valueWithCGPoint:CGPointMake(self.pwdView.center.x, self.pwdView.center.y)]];
    [move setToValue:[NSValue valueWithCGPoint:CGPointMake(self.pwdView.center.x, self.pwdView.center.y + self.accountBox.frame.size.height)]];
    [move setDuration:ANIMATION_DURATION];
    [self.pwdView.layer addAnimation:move forKey:nil];
    self.accountBox.hidden = NO;
    //模糊处理
    [self.iconView setAlpha:0.5f];
    [self.accountFeild setAlpha:0.5f];
    [self.pwdFeild setAlpha:0.5f];
   
    CABasicAnimation *scale=[CABasicAnimation animationWithKeyPath:@"transform"];
    [scale setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.2, 1.0)]];
    [scale setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    CABasicAnimation *center=[CABasicAnimation animationWithKeyPath:@"position"];
    [center setFromValue:[NSValue valueWithCGPoint:CGPointMake(_accountBox.center.x, _accountBox.center.y-_accountBox.bounds.size.height/2)]];
    [center setToValue:[NSValue valueWithCGPoint:CGPointMake(_accountBox.center.x, _accountBox.center.y)]];
    
    CAAnimationGroup *group=[CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:scale,center, nil]];
    [group setDuration:ANIMATION_DURATION];
    [_accountBox.layer addAnimation:group forKey:nil];
    
    
    
    [_pwdView setCenter:CGPointMake(_pwdView.center.x,_pwdView.center.y+_accountBox.frame.size.height)];
    

}
/** 隐藏 */
- (void)hideAccountBox{
    [self.dropBtn setSelected:NO];
    CABasicAnimation *move=[CABasicAnimation animationWithKeyPath:@"position"];
    [move setFromValue:[NSValue valueWithCGPoint:CGPointMake(_pwdView.center.x, _pwdView.center.y)]];
    [move setToValue:[NSValue valueWithCGPoint:CGPointMake(_pwdView.center.x, _pwdView.center.y-_accountBox.frame.size.height)]];
    [move setDuration:ANIMATION_DURATION];
    [_pwdView.layer addAnimation:move forKey:nil];
    
    [_pwdView setCenter:CGPointMake(_pwdView.center.x, _pwdView.center.y-_accountBox.frame.size.height)];
    [self.iconView setAlpha:1.0f];
    [self.accountFeild setAlpha:1.0f];
    [self.pwdFeild setAlpha:1.0f];
   
    
    CABasicAnimation *scale=[CABasicAnimation animationWithKeyPath:@"transform"];
    [scale setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    [scale setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 0.2, 1.0)]];
    
    CABasicAnimation *center=[CABasicAnimation animationWithKeyPath:@"position"];
    [center setFromValue:[NSValue valueWithCGPoint:CGPointMake(_accountBox.center.x, _accountBox.center.y)]];
    [center setToValue:[NSValue valueWithCGPoint:CGPointMake(_accountBox.center.x, _accountBox.center.y-_accountBox.bounds.size.height/2)]];
    
    CAAnimationGroup *group=[CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:scale,center, nil]];
    [group setDuration:ANIMATION_DURATION];
    [_accountBox.layer addAnimation:group forKey:nil];
    
    
    [_accountBox performSelector:@selector(setHidden:) withObject:[NSNumber numberWithBool:NO] afterDelay:ANIMATION_DURATION];

}

/** 添加下拉控件 */
- (void)reloadAccountBox{
    for (UIView *view in self.accountBox.subviews) {
        if (view.tag != 20000) {
            [view removeFromSuperview];
        }
    }
    NSInteger count = self.datas.count;
// 1 图片之间的间距
    CGFloat insets = 0.0;
    
    // 2 图片的宽度及其背景高宽
    CGFloat imageW = 49;
    CGFloat bgH = 80;
    CGFloat bgW = self.view.frame.size.width;
    //根据账号数量对3的商来计算整个view高度的调整
    CGFloat newHeight;
    newHeight=((count-1)/3)*80+80;
    if (newHeight!=bgH) {
        [_accountBox setFrame:CGRectMake(_accountBox.frame.origin.x, _accountBox.frame.origin.y, _accountBox.frame.size.width, newHeight)];
    }
    
    CGFloat paddingTop=(bgH-imageW)/2;
    CGFloat paddingLeft=(320-bgW)/2;
    if (count >3) {
        insets=(bgW-imageW*3)/4;
    }else{
        //根据图片数量对3取模计算间距
        switch (count%3) {
            case 0:
                insets=(bgW-imageW*3)/4;
                
                break;
            case 1:
                insets=(bgW-imageW)/2;
                break;
            case 2:
                insets=(bgW-imageW*2)/3;
                break;
            default:
                break;
        }
    }
    for (int i=0;i<self.datas.count;i++)
    {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(paddingLeft+insets+(i%3)*(imageW+insets), paddingTop+80*(i/3), imageW, imageW)];
        [button setBackgroundImage:[UIImage imageNamed:@"login_dropdown_avatar_border"] forState:UIControlStateNormal];
        [button.imageView setImage:[UIImage imageNamed:@"login_avatar"]];
        button.tag=10000+i;
        [button addTarget:self action:@selector(chooseAccount:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *headImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45 , 45)];
        [headImage.layer setCornerRadius:3.0];
        [headImage setClipsToBounds:YES];
        [headImage setCenter:CGPointMake(button.center.x, button.center.y)];
        [headImage setImage:[UIImage imageNamed:[self.datas[i] objectForKey:@"icon"]]];
        [_accountBox addSubview:headImage];
        [_accountBox addSubview:button];
        
    }
    
}

- (void)chooseAccount:(UIButton*)button
{
    NSInteger accountIndex=button.tag-10000;
    [self.accountFeild setText:[[self.datas  objectAtIndex:accountIndex] objectForKey:@"account"] ];
    [
     self.pwdFeild setText:[[self.datas objectAtIndex:accountIndex] objectForKey:@"pwd"]];
    [self.iconView setImage:[UIImage imageNamed:[[self.datas  objectAtIndex:accountIndex] objectForKey:@"icon"]]];
    [self hideAccountBox];
}


@end
