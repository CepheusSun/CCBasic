//
//  MNavigationController.m
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "MNavigationController.h"

@interface MNavigationController ()

@end

@implementation MNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor blackColor];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIColor * color = [UIColor colorWithHexString:@"#050505"];
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    
    //隐藏返回按钮文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
}



@end
