//
//  ApiManager.m
//  00-qq
//
//  Created by ningning on 15/12/21.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "ApiManager.h"

@implementation ApiManager
/** 单例化*/
+(instancetype)showManager{
    static ApiManager *apiManager = nil;
    @synchronized(self) {
        if (apiManager == nil) {
            apiManager = [[self alloc] init];
        }
    }
    return apiManager;

}

/** 设置查询时间*/
- (AFHTTPRequestOperationManager *)networkManager
{
    if (_networkManager) {
        return _networkManager;
    }
    _networkManager = [[AFHTTPRequestOperationManager alloc] init];
    _networkManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [_networkManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _networkManager.requestSerializer.timeoutInterval = 8.0f;
    [_networkManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];

    return _networkManager;
}

/** POST*/
- (AFHTTPRequestOperation *)POST:(NSString *)urlStr parameters:(id)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    return [self.networkManager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:nil];
        success(dic);
    } failure:failure];


}
@end
