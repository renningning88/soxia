//
//  RnRegisterViewController.h
//  soxia
//
//  Created by ningning on 15/12/23.
//  Copyright © 2015年 ningning. All rights reserved.
//
@class RnRegisterViewController;
@protocol RnRegisterViewControllerDelegate <NSObject>

@optional
- (void)registerViewController:(RnRegisterViewController*)registerViewController didLoadDatas:(NSMutableArray *)datas;

@end



#import <UIKit/UIKit.h>
#import "RnButton.h"
@interface RnRegisterViewController : UIViewController
@property(nonatomic, strong)NSMutableArray *datas;
@property (strong, nonatomic) IBOutlet UITextField *accountFeild;
@property (strong, nonatomic) IBOutlet UITextField *mailFeild;
@property (strong, nonatomic) IBOutlet UITextField *pwdFeild;
- (IBAction)saveBtnClick:(RnButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *warnFeild;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property(nonatomic, strong)id <RnRegisterViewControllerDelegate>delegate;

@end
