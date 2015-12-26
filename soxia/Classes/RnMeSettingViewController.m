//
//  RnMeSettingViewController.m
//  soxia
//
//  Created by ningning on 15/12/25.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnMeSettingViewController.h"
#import "RnSettingItem.h"
#import "RnSettingItemCell.h"
@interface RnMeSettingViewController ()

@end

@implementation RnMeSettingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setMeDatas];
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleSingleLine ;
}

- (void)setMeDatas{
//    NSMutableArray *meDatas = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"setting.plist" ofType:nil];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    for (NSArray *arr in dicArray) {
        NSMutableArray *dataArray = [NSMutableArray array];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            RnSettingItem *item = [[RnSettingItem alloc] initWithDic:obj];
            [dataArray addObject:item];
        }];
        [self.datas addObject:arr];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0 ) {
    
        return 60;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        cell.imageView.layer.cornerRadius = 8.0f;
        cell.imageView.layer.masksToBounds = YES;
       
        
    }
//    NSLog(@"willDisplayingCell");
}

@end
