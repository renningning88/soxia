//
//  RnMeSexSettingViewController.h
//  soxia
//
//  Created by ningning on 15/12/27.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RnMeSexSettingViewController : UITableViewController
@property(nonatomic,strong)NSIndexPath *seleIndexpath;
@property(nonatomic,strong)NSArray *cellDatas;
@property(nonatomic,strong)NSMutableArray *ys;
- (instancetype)initWithDatas:(NSArray *)cellDatas;
@end
