//
//  UIControl+CCBlock.m
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "UIControl+CCBlock.h"
@import ObjectiveC.runtime;

static const void *CCControlHanlders_Key = &CCControlHanlders_Key;

@interface CCControlWrapper : NSObject<NSCopying>

- (id)initWithHandler:(void (^)(id sender))handler
     forControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic) UIControlEvents controlEvents;
@property (nonatomic ,copy) void (^handler)(id sender);

@end

@implementation CCControlWrapper

- (id)initWithHandler:(void (^)(id sender))handler
     forControlEvents:(UIControlEvents)controlEvents {
    
    self = [super init];
    if (!self) return nil;
    
    self.handler = handler;
    self.controlEvents = controlEvents;
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[CCControlWrapper alloc] initWithHandler:self.handler
                                    forControlEvents:self.controlEvents];
}

- (void)invoke:(id)sender {
    self.handler(sender);
}
@end

@implementation UIControl (CCBlock)

- (void)addEventHandler:(void (^)(id _Nonnull))handler
        forControlEvent:(UIControlEvents)controlEvents {

    NSParameterAssert(handler);
    
    NSMutableDictionary *events = objc_getAssociatedObject(self, CCControlHanlders_Key);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self,
                                 CCControlHanlders_Key,
                                 events,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    NSNumber *key = @(controlEvents);
    NSMutableSet *handlers = events[key];
    if (!handler) {
        handlers = [NSMutableSet set];
        events[key] = handlers;
    }
    
    CCControlWrapper *target = [[CCControlWrapper alloc] initWithHandler:handler forControlEvents:controlEvents];
    [handlers addObject:target];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
}

- (void)removeEventHandlersForControlEvents:(UIControlEvents)controlEvents {
    NSMutableDictionary *events = objc_getAssociatedObject(self, CCControlHanlders_Key);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, CCControlHanlders_Key, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    NSNumber *key = @(controlEvents);
    NSSet *handlers = events[key];
    
    if (!handlers) return;
    
    [handlers enumerateObjectsUsingBlock:^(id sender, BOOL * _Nonnull stop) {
        [self removeTarget:sender action:NULL forControlEvents:controlEvents];
    }];
    [events removeObjectForKey:key];
    
}

- (BOOL)hasEventHandlersForControlEvents:(UIControlEvents)controlevent {
    NSMutableDictionary *events = objc_getAssociatedObject(self, CCControlHanlders_Key);
    if (!events) {
        events = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, CCControlHanlders_Key, events, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    NSNumber *key = @(controlevent);
    NSSet *handlers = events[key];
    
    if (!handlers) return NO;
    return !!handlers.count;
}

@end
