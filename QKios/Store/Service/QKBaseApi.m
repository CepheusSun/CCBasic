//
//  QKBaseApi.m
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKBaseApi.h"

@implementation QKBaseApi
- (NSString *)serviceType {
    return @"QKServiceIdentifier";
}

- (NSError *)isResponseIllegal:(SYResponse *)response {
    if (![response.content[@"code"] isEqual: @(0)]) {
        return [[NSError alloc] initWithDomain:response.content[@"msg"] code:-10000 userInfo:nil];
    }
    return nil;
}
@end
