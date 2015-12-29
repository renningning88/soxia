//
//  RnMeNameViewController.h
//  soxia
//
//  Created by ningning on 15/12/29.
//  Copyright © 2015年 ningning. All rights reserved.
//
@class RnMeNameViewController;
@protocol RnMeNameViewControllerDelegate <NSObject>

@optional
- (void)rnMeNameViewController:(RnMeNameViewController *)vc reloadName:(NSString *)name;

@end
#import <UIKit/UIKit.h>

@interface RnMeNameViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameFeild;
@property(nonatomic, strong)id <RnMeNameViewControllerDelegate>delegate;
@end
