//
//  ApiManager.h
//  00-qq
//
//  Created by ningning on 15/12/21.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject
@property(nonatomic,strong)AFHTTPRequestOperationManager *networkManager;


/** 单例化*/
+ (instancetype)showManager;

/** POST*/
- (AFHTTPRequestOperation *)POST:(NSString *)urlStr
                          parameters:(id)parameters
                         success:(void (^)(NSDictionary  *jsonDic))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
@end
