//
//  RnFogotPwdViewController.h
//  soxia
//
//  Created by ningning on 15/12/23.
//  Copyright © 2015年 ningning. All rights reserved.
//
@class RnFogotPwdViewController;
@protocol RnFogotPwdViewControllerDelegate <NSObject>

@optional
-(void)fogotPwdViewController:(RnFogotPwdViewController*)fogotPwdViewController didLoadDatas:(NSMutableArray *)datas;
@end

#import <UIKit/UIKit.h>
#import "RnButton.h"
@interface RnFogotPwdViewController : UIViewController
@property(nonatomic, strong)NSMutableArray *datas;
@property (strong, nonatomic) IBOutlet UITextField *accountFeild;
@property (strong, nonatomic) IBOutlet UITextField *pwdFeild;
@property(strong, nonatomic)id <RnFogotPwdViewControllerDelegate>delegate;
- (IBAction)saveBtnClick:(RnButton *)sender;
@property (strong, nonatomic) IBOutlet RnButton *saveBtn;

@end
