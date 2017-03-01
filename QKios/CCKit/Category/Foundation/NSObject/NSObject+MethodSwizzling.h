//
//  NSObject+MethodSwizzling.h
//  DPHMechart
//
//  Created by 孙扬 on 2016/11/1.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MethodSwizzling)

+ (void)sy_swizzleInstanceSelector:(SEL)origSelector
                   swizzleSelector:(SEL)swizzleSelector;


+ (void)sy_swizzleClassSelector:(SEL)origSelector
                swizzleSelector:(SEL)swizzleSelector;

@end
