//
//  RnLoginViewController.h
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RnButton.h"
@interface RnLoginViewController : UIViewController
@property (nonatomic,strong)NSDictionary *dic;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UIView *accountView;
@property (strong, nonatomic) IBOutlet UITextField *accountFeild;
@property (strong, nonatomic) IBOutlet RnButton *dropBtn;

@property (strong, nonatomic) IBOutlet UIView *pwdView;

@property (strong, nonatomic) IBOutlet UITextField *pwdFeild;

@property (strong, nonatomic) IBOutlet RnButton *loginBtn;
- (IBAction)fogotPwdBtnClick:(id)sender;

- (IBAction)registerBtnClick:(id)sender;
- (IBAction)loginBtnClick:(id)sender;


@end
