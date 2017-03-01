//
//  UIScrollView+HeaderImageScale.h
//  DPHMechart
//
//  Created by 孙扬 on 2016/10/23.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYKeyPath(objc,keyPath) @(((void)objc.keyPath,#keyPath))
@interface UIScrollView (HeaderImageScale)


@property (nonatomic ,strong) UIImage *sy_headerScaleImage;


@property (nonatomic ,assign) CGFloat sy_headerImageHeight;

@property (nonatomic ,assign) BOOL sy_isInitial;
@end
