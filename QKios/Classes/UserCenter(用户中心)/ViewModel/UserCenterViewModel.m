//
//  UserCenterViewModel.m
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "UserCenterViewModel.h"
#import "TourLoginApi.h"

@interface UserCenterViewModel ()
{
    TourLoginApi *_tourLoginApi;
}
@end

@implementation UserCenterViewModel

- (void)tourLogin {
    _tourLoginApi  = [[TourLoginApi alloc] init];
    [_tourLoginApi startWithSuccessBlock:^(SYResponse *response, NSString *errorMessage) {
        DLog(@"%@", response.content);
    } failureBlbck:^(SYResponse *response, NSString *errorMessage) {
        DLog(@"%@",errorMessage);
    }];
}
@end
