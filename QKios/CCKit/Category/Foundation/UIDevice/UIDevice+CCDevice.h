//
//  UIDevice+CCDevice.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CCDevice)

/**
 * 获取当前系统版本号
 *
 *  @return Return the iOS version
 */
+ (float)iOSVersion;

/**
 *  当前设备的MAC地址
 *
 *  @return Return the current device MAC address
 */
+ (NSString *)macAddress;

/**
 *  生成一个惟一的标识符并存储到standardUserDefaults
 *
 *  @return Return a unique identifier as a NSString
 */
+ (NSString *)uniqueIdentifier;

/**
 *  Return the device platform string
 *  Example: "iPhone3,2"
 *
 *  @return Return the device platform string
 */
+ (NSString *)devicePlatform;

+ (CGFloat)deviceScreenWidth;
@end
