//
//  RnMeCellPushViewController.h
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RnBasicView.h"
@interface RnMeCellPushViewController : UIViewController

@property(nonatomic,strong)UIDatePicker *picker;
@property(nonatomic, strong)UITextField *cellFeild;
@property (nonatomic, strong)UIView *cellView;
@property (nonatomic, strong)UITableView *schoolView;
- (instancetype)initWithTitle:(NSString *)title;

@property(nonatomic,strong)NSArray *schoolDatas;
@end
