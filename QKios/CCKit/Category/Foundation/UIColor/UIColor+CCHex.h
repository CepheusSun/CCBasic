//
//  UIColor+CCHex.h
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CCHex)

/**
 生成十六进制颜色(字符串)

 @param hexString Hex String
 @return Return the UIColor Instance
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 生成十六进制颜色
 
 @param hex HEX value
 @return Return the UIColor instance
 */
+ (UIColor *)colorWithHex:(unsigned int)hex;


/**
 生成十六进制颜色(带透明度)

 @param hex Hex Value
 @param alpha Alpha Value
 @return Return the UIColor Instance
 */
+ (UIColor *)colorWithHex:(unsigned int)hex
                    alpha:(float)alpha;


/**
 返回一个颜色的十六进制字符串

 @return 十六进制字符串
 */
- (NSString *)HexString;
@end
