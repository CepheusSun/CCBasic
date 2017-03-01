//
//  UIWindow+CCScreenshot.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (CCScreenshot)

/**
 *  当前屏幕截图
 *
 *  @return Return the screenshot as an UIImage
 */
- (UIImage *)takeScreenshot;

@end
