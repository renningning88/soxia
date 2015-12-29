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

    [self setUpDatas:@"setting.plist"];

    self.tableView.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
    NSLog(@"viewDidLoad%lu",(unsigned long)self.datas.count);
}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self setUpDatas:@"setting.plist"];
//    
//    self.tableView.separatorStyle =UITableViewCellSeparatorStyleSingleLine;
//    NSLog(@"viewDidAppear%lu",(unsigned long)self.datas.count);
//}
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
 
}



@end
