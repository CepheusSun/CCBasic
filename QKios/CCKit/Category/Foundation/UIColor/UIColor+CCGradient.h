//
//  UIColor+CCGradient.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CCGradient)


/**
 渐变颜色

 @param fromColor From Color
 @param toColor To Color
 @param height Height
 @return Return a UIColor Instance with gradient 
 */
+ (UIColor *)gradientFrom:(UIColor *)fromColor
                       to:(UIColor *)toColor
                   height:(CGFloat)height;
@end
