//
//  RnBaicTableViewCell.m
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import "RnBaicTableViewCell.h"

@implementation RnBaicTableViewCell
#pragma mark - 重写getter方法
- (UISwitch *)switchView{
    if (_switchView) {
        return _switchView;
    }
    _switchView = [[UISwitch alloc] init];
    return _switchView;
}

- (UILabel *)label{
    if (_label) {
        return _label;
    }
    _label = [[UILabel alloc] init];
    _label.font = [UIFont systemFontOfSize:14.0f];
    return _label;
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"RnBaicTableViewCell";
   RnBaicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[RnBaicTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    
    return cell;
}

- (void)setCellContent:(NSDictionary *)dic{
    [self setSimiliarContent:dic];
    [self setRightContent:dic];


}

- (void)setSimiliarContent:(NSDictionary *)dic{
    
    if ([dic objectForKey:@"icon"]) {
        self.imageView.image = [UIImage imageNamed:[dic objectForKey:@"icon"]];
    }
    self.textLabel.text = [dic objectForKey:@"title"];
    
    
}

- (void)setRightContent:(NSDictionary *)dic{
    if ([[dic objectForKey:@"type"] isEqualToString:@"ArrowItem"]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.detailTextLabel.text = [dic objectForKey:@"detail"];
        self.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
    }else if ([[dic objectForKey:@"type"] isEqualToString:@"SwitchItem"]){
        
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if([[dic objectForKey:@"type"] isEqualToString:@"LableItem"]){
        self.accessoryView = self.label;
        self.label.text = [dic objectForKey:@"detail"];
        
    }
    
}

@end
