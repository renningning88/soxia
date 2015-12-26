//
//  RnSettingItemCell.m
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnSettingItemCell.h"

@implementation RnSettingItemCell

- (void)awakeFromNib {
    // Initialization code
}

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
#pragma mark - 设置内容
- (void)setItem:(RnSettingItem *)item{
    _item = item;
//    NSLog(@"%@",item.icon);
// 1 设置相同内容
    [self setSimiliarContent];
  
    self.textLabel.text = self.item.title;

// 2 设置右边不同内容
    [self setRightContent];


}
- (void)setSimiliarContent{
    
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    

}

- (void)setRightContent{
    if ([self.item.type isEqualToString:@"ArrowItem"]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.detailTextLabel.text = self.item.detail;
        self.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
    }else if ([self.item.type isEqualToString:@"SwitchItem"]){
    
        self.accessoryView = self.switchView;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if([self.item.type isEqualToString:@"LableItem"]){
        self.accessoryView = self.label;
        self.label.text = self.item.detail;
    
    }

}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"RnSettingItemCell";
    RnSettingItemCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[RnSettingItemCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }

    return cell;
}

@end
