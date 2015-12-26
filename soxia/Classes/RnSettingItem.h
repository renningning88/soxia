//
//  RnSettingItem.h
//  soxia
//
//  Created by ningning on 15/12/24.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RnSettingItem : NSObject
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *detail;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *vcClass;


- (instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)itemWithDic:(NSDictionary *)dic;

@end
