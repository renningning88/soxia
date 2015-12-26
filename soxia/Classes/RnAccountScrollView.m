//
//  RnAccountScrollView.m
//  soxia
//
//  Created by ningning on 15/12/22.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnAccountScrollView.h"

@implementation RnAccountScrollView
- (instancetype)initWithFrame:(CGRect)frame WithDatas:(NSArray *)datas{
    if (self = [super initWithFrame:frame]) {
        self.datas = datas;
        // 1 加载图片
        CGFloat btnW = 50;
        CGFloat btnH = 50;
        CGFloat margin = 10;
        for (int i = 0; i < self.datas.count; i++) {
            CGFloat btnY = 0;
            CGFloat btnX = (btnW +margin) *i;
            RnButton * btn = [[RnButton alloc] init];
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            btn.tag = i;
            [btn addTarget:self action:@selector(choseBtn:) forControlEvents:UIControlEventTouchDown ];
            [self addSubview:btn];
        }
        
        // 2 设置可滑动范围
        CGFloat scrW = btnW *self.datas.count;
        self.contentSize = CGSizeMake(scrW, 0);
        
        // 3 隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        
        // 4 不可分页
        self.pagingEnabled = NO;
        
    }

    return self;
}

- (void)choseBtn:(RnButton *)sender{

 
    NSLog(@"chosebtn");


}
@end
