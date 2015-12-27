//
//  RnLoginViewController.h
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RnButton.h"
#import "AccountTable.h"
@interface RnLoginViewController : UIViewController
@property(nonatomic, strong)NSMutableArray *datas;

@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UIView *accountView;
@property (strong, nonatomic) IBOutlet UITextField *accountFeild;
@property (strong, nonatomic) IBOutlet RnButton *dropBtn;

@property (strong, nonatomic) IBOutlet UIView *pwdView;

@property (strong, nonatomic) IBOutlet UIView *accountBox;

@property (strong, nonatomic) IBOutlet UITextField *pwdFeild;
- (IBAction)dropBtnClick:(id)sender;

@property (strong, nonatomic) IBOutlet RnButton *loginBtn;
- (IBAction)fogotPwdBtnClick:(id)sender;

- (IBAction)registerBtnClick:(id)sender;
- (IBAction)loginBtnClick:(id)sender;


@end
