//
//  QKService.m
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKService.h"
#import "QKApiList.h"
#import "QKRequestParametersBuilder.h"
@implementation QKService

- (NSString *)baseUrl {
    return MPIA_URL;
}

- (SYRequestParametersBuilder *)requestParametersBuilder {
    return [QKRequestParametersBuilder sharedInstance];
}

@end
