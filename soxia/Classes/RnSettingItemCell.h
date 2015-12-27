//
//  RnSettingItemCell.h
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RnSettingItem.h"
#import "RnViewCell.h"
@interface RnSettingItemCell : RnViewCell
//@property (nonatomic,strong)UIView *divider;
@property(nonatomic, strong)UISwitch *switchView;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)RnSettingItem *item;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
