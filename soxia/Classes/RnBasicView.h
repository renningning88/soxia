//
//  RnBasicTableView.h
//  soxia
//
//  Created by ningning on 16/1/2.
//  Copyright © 2016年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnBasicView : UIView <UITableViewDataSource>
@property(nonatomic, strong)NSArray *datas;

@property (nonatomic, strong)UITableView *tableView;

+(instancetype)basicWithName:(NSString *)plistName;
-(instancetype)initWithDatas:(NSArray *)datas;
@end
