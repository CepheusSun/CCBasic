//
//  QKMineController+NavigationHidden.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//


// 我的页面导航栏隐藏相关功能放在这里

#import "QKMineController.h"


@interface QKMineController (NavigationHidden)

@property (nonatomic ,strong)CAShapeLayer *progressLayer;
@property (nonatomic ,assign)BOOL isLoading;
@end
