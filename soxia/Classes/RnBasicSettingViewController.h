//
//  RnBasicSettingViewController.h
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnBasicSettingViewController : UITableViewController
@property(nonatomic, strong)NSMutableArray *datas;
- (instancetype)initWithName:(NSString *)name;
-(void)setUpDatas:(NSString *)name;
@end
