//
//  QKUserInfo.m
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKUserInfo.h"


#pragma mark - 密码 ID

//********* 真实用户登录后信息 NSUserDefaults_Key ***************
#define USER_DATA_KEY @"UserData_Token"
//游客登录信息KEY
#define TOURIST_DATA_KEY @"tourist_Token"
//********* 用户登录标示
#define USER_LOGIN @"isLogin"


#define KEY_NAMEPASSWORD  @"COM.RIMI.app.namepassword"
#define KEY_NAME  @"COM.RIMI.app.name"
#define KEY_PASSWORD  @"COM.RIMI.app.password"
#define KEY_TOKEN  @"COM.RIMI.app.password"

@implementation QKUserInfo

+ (instancetype)shared {
    static QKUserInfo *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[self alloc] init];
    });
    return user;
}


+ (NSInteger)getAge:(NSDate *)userBirthday
{
    //计算年龄
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
    NSTimeInterval time=[currentDate timeIntervalSinceDate:userBirthday];
    int age = ((int)time)/(3600*24*365);
    return age;
}


- (BOOL)isLogin {
    BOOL isLogin = [[NSUserDefaults standardUserDefaults] objectForKey:USER_LOGIN];
    if (isLogin) {
        NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DATA_KEY];
        [QKUserInfo yy_modelWithDictionary:dict];
        isLogin = self.token?![self.token isEqualToString:@"4ea4341004e3a4cfff1126d59be2cb04"]:NO;

    }
    return isLogin;
}
@end
