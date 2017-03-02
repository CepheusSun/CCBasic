//
//  QKApiList.h
//  QKios
//
//  Created by sunny on 2017/3/2.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#ifndef QKApiList_h
#define QKApiList_h


#define MROOT_URL @"http://liveapi.chaoyu.tv"
//#define MROOT_URL @"http://testliveapi.chaoyu.tv"

#define MPIA_URL  [NSString stringWithFormat:@"%@/OpenAPI/v1/",MROOT_URL]


#pragma mark ***************用户登录****************
//注册
#define Regist_URL  @"user/register"
//登录
#define Login_URL @"user/login"
//游客登录
#define Tlogin_URL  @"user/touristlogin"

#define BindThirdPart_URL  @"user/bindThirdPartyId"

//自动登录
#define MAutoLogin_url @"user/autoLogin"
//注销
#define Logout_URL @"user/logout"
//第三方登录
#define MThirdPartyAuthLogin_url @"auth/login"
//获得验证码
#define MSMS_SendSMS_Get_URl @"SMS/sendSMS"
//验证码登录
#define MSMS_Verify_Post_URl @"SMS/verify"


#endif /* QKApiList_h */
