//
//  UIBarButtonItem+CCBlock.h
//  QKios
//
//  Created by sunny on 2017/2/28.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIBarButtonItem (CCBlock)

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem
                                    handler:(void (^)(id sender))action;


- (instancetype)initWithImage:(UIImage *)image
                        style:(UIBarButtonItemStyle)style
                      handler:(void(^)(id sender))action;


- (instancetype)initWithImage:(UIImage *)image
          landscapeImagePhone:(UIImage *)landscapeImagePhone
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action;


- (instancetype)initWithTitle:(NSString *)title
                        style:(UIBarButtonItemStyle)style
                      handler:(void (^)(id sender))action;

@end
NS_ASSUME_NONNULL_END
