//
//  NSArray+CCSafe.m
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "NSArray+CCSafe.h"


@implementation NSArray (CCSafe)

- (id)safe_objectAtIndex:(NSUInteger)index {
    if([self count] > 0 && [self count] > index){
        return [self objectAtIndex:index];
    }
    return nil;
}

@end


@implementation NSMutableArray (CCSafe)

-(void)addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}

@end
