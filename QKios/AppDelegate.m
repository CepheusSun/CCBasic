//
//  AppDelegate.m
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "AppDelegate.h"
#import "QKTabbarController.h"
#import "UserCenterViewModel.h"
#import <SYNetwork/SYNetwork.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[QKTabbarController alloc] init];
    [self.window makeKeyAndVisible];
    
    [[SYRequestConfig sharedConfig] configTimeOutInterval:20 cacheCountLimit:1000 serviceStorage:@{@"QKServiceIdentifier":@"QKService"}];
    UserCenterViewModel *model = [[UserCenterViewModel alloc] init];
    [model tourLogin];
    return YES;
}



@end
