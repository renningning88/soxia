//
//  RnBaicTableViewCell.h
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnBaicTableViewCell : UITableViewCell
@property(nonatomic, strong)UISwitch *switchView;
@property(nonatomic, strong)UILabel *label;

+(instancetype)cellWithTableView:(UITableView *)tableView;

- (void)setCellContent:(NSDictionary *)dic;
@end
