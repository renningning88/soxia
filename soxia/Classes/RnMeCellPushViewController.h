//
//  RnMeCellPushViewController.h
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnMeCellPushViewController : UIViewController
@property(nonatomic,strong)NSArray *yearDatas;
@property(nonatomic,strong)NSArray *monthDatas;
@property(nonatomic,strong)NSArray *dateDatas;
@property(nonatomic, strong)UITextField *cellFeild;
@property (nonatomic, strong)UIView *cellView;
@property (nonatomic,strong)UIPickerView *picker;
- (instancetype)initWithTitle:(NSString *)title;
@end
