//
//  RnSettingItem.m
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnSettingItem.h"

@implementation RnSettingItem
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+(instancetype)itemWithDic:(NSDictionary *)dic{

    return [[self alloc] initWithDic:dic];
}




@end
