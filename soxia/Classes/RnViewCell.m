//
//  RnViewCell.m
//  soxia
//
//  Created by ningning on 15/12/26.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnViewCell.h"

@implementation RnViewCell
- (void)layoutSubviews{
    [super layoutSubviews];

    self.imageView.bounds = CGRectMake(0, 0, 44, 44);
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    CGRect tmpBounds = CGRectMake(0, 0, self.detailTextLabel.frame.size.width, 44);
    self.detailTextLabel.bounds = tmpBounds;
    
}

@end
