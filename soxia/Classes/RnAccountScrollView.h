//
//  RnAccountScrollView.h
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

//@class RnAccountScrollView;
//@class RnButton;
//@protocol RnAccountScrollViewDelegate <NSObject>
//
//@optional
//- (void)accountScrollView:(RnAccountScrollView *)account DidClickBtn:(RnButton *)btn;
//
//@end

#import <UIKit/UIKit.h>
#import "RnButton.h"
@interface RnAccountScrollView : UIScrollView
@property(nonatomic,strong)NSArray *datas;

- (instancetype)initWithFrame:(CGRect)frame WithDatas:(NSArray *)datas;

@end
