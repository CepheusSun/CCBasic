//
//  QKUserInfo.h
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QKUserInfo : NSObject

+ (instancetype)shared;

- (BOOL)isLogin;


//头像
@property (nonatomic, copy) NSString *avatar;
//金币
@property (nonatomic, copy) NSString *coinbalance;
//房间号
@property (nonatomic, copy) NSString *curroomnum;
//用户id
@property (nonatomic, copy) NSString *_id;
//昵称（可更改）
@property (nonatomic, copy) NSString *nickname;
//用户名（不可更改）
@property (nonatomic, copy) NSString *username;
//token
@property (nonatomic, copy) NSString *token;
//
@property (nonatomic, copy) NSString  *ucuid;
//城市
@property (nonatomic, copy) NSString *city;
//生日
@property (nonatomic, copy) NSString  *birthday;
//等级
@property (nonatomic, copy) NSString  *emceelevel;
//是否绑定微信 为空时 未绑定
@property (nonatomic, copy) NSString  *wxunionid;
//是否认证 返回字段:用户未认证时返回@"未认证" 认证了的用户返回认证类型
@property (nonatomic, copy) NSString  *approveid;

@end
