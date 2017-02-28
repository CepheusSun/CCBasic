//
//  UIBarButtonItem+CCBlock.m
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "UIBarButtonItem+CCBlock.h"
@import ObjectiveC.runtime;

static const void *CCBarButtonItemBlock_Key = &CCBarButtonItemBlock_Key;

@interface UIBarButtonItem (BlockPrivate)

- (void)handleAction:(UIBarButtonItem *)sender;

@end

@implementation UIBarButtonItem (CCBlock)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                    handler:(void (^)(id _Nonnull))action {
    self = [self initWithBarButtonSystemItem:systemItem
                                      target:self
                                      action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             CCBarButtonItemBlock_Key,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id _Nonnull))action {
    self = [self initWithImage:image
                         style:style
                        target:self
                        action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             CCBarButtonItemBlock_Key,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
          landscapeImagePhone:(UIImage *)landscapeImagePhone
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id _Nonnull))action {
    self = [self initWithImage:image
           landscapeImagePhone:landscapeImagePhone
                         style:style
                        target:self
                        action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             CCBarButtonItemBlock_Key,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action
{
    self = [self initWithTitle:title
                         style:style
                        target:self
                        action:@selector(handleAction:)];
    if (!self) return nil;
    objc_setAssociatedObject(self,
                             CCBarButtonItemBlock_Key,
                             action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}


- (void)handleAction:(UIBarButtonItem *)sender
{
    void (^block)(id) = objc_getAssociatedObject(self, CCBarButtonItemBlock_Key);
    if (block) block(sender);
}

@end
