//
//  NSObject+MethodSwizzling.m
//  DPHMechart
//
//  Created by 孙扬 on 2016/11/1.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "NSObject+MethodSwizzling.h"
@import ObjectiveC.runtime;

@implementation NSObject (MethodSwizzling)

+ (void)sy_swizzleInstanceSelector:(SEL)origSelector
                   swizzleSelector:(SEL)swizzleSelector {
    
    Method origMethod = class_getInstanceMethod(self, origSelector);
    Method swizzleMethod = class_getInstanceMethod(self, swizzleSelector);
    
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) {
        method_exchangeImplementations(origMethod, swizzleMethod);
    }else {
        class_replaceMethod(self, swizzleSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
}

+ (void)sy_swizzleClassSelector:(SEL)origSelector
                swizzleSelector:(SEL)swizzleSelector {
    
    Method origMethod = class_getClassMethod(self, origSelector);
    Method swizzleMethod = class_getClassMethod(self, swizzleSelector);
    
    BOOL isAdd = class_addMethod(self, origSelector, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    
    if (!isAdd) {
        method_exchangeImplementations(origMethod, swizzleMethod);
    }
}

@end
