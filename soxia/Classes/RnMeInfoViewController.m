//
//  RnMeInfoViewController.m
//  soxia
//
//  Created by ningning on 15/12/26.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnMeInfoViewController.h"
#import "RnSettingItem.h"
#import "RnBasicSettingViewController.h"
#import "RnMeNameViewController.h"
@interface RnMeInfoViewController ()<MBButtonMenuViewControllerDelegate>
@property(nonatomic, strong)MBButtonMenuViewController *menu;
@end

@implementation RnMeInfoViewController

#pragma mark - 视图加载

- (void)viewDidLoad{
    [super viewDidLoad];
//    [self setUpDatas:@"me.plist" ];
//    self.title = @"个人资料";
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
//    self.tableView.separatorColor = [UIColor redColor];
    [self.tableView reloadData];
}
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"==================================");
    [self setUpDatas:@"me.plist" ];
    self.title = @"个人资料";
    [super viewDidAppear:animated];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        return 60;
    }

    return 44;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *cellArray = self.datas[indexPath.section];
    RnSettingItem *item = [[RnSettingItem alloc] initWithDic:cellArray[indexPath.row]];
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    NSString *name =[defult objectForKey:@"name"];
    if (indexPath.section == 0 ) {
        if ( indexPath.row == 0) {
            cell.detailTextLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:item.detail]];
            cell.detailTextLabel.text = @"            ";
            cell.detailTextLabel.layer.cornerRadius = 8.0f;
            cell.detailTextLabel.layer.masksToBounds = YES;
        }else if (indexPath.row ==1)
           
            cell.detailTextLabel.text =name ;
        }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 ) {
        if (indexPath.row ==0) {
             [self showmenu];
        }else{
            RnMeNameViewController *vc = [[RnMeNameViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else{

    }



}

- (void)showmenu{
    if (![self menu]) {
        NSArray *titles = @[@"用相机拍照",
                            @"从手机相册中选择",
                            @"取消"
                            ];
        _menu = [[MBButtonMenuViewController alloc] initWithButtonTitles:titles];
        [_menu setDelegate: self];
        [_menu setCancelButtonIndex:[[_menu buttonTitles] count] -1];
    }
     [[self menu] showInView:[self view]];
}


#pragma mark - MBButtonMenuViewController代理提示按钮操作

- (void)buttonMenuViewController:(MBButtonMenuViewController *)buttonMenu buttonTappedAtIndex:(NSUInteger)index{

    if (index == 0) {//用相机拍照
        [buttonMenu hide];
        
        
    }else if (index == 1){//从手机相册中选择
    
    
        [buttonMenu hide];
        
    }



}

- (void)buttonMenuViewControllerDidCancel:(MBButtonMenuViewController *)buttonMenu{

    [buttonMenu hide];


}

@end
