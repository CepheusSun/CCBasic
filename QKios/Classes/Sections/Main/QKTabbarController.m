//
//  QKTabbarController.m
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKTabbarController.h"
#import "MNavigationController.h"

@interface QKTabbarController ()<UITabBarControllerDelegate>

@property (nonatomic, copy) NSArray<NSString *> *vcTitles;
@property (nonatomic, copy) NSArray<NSString *> *imageNames;
@property (nonatomic, copy) NSArray<NSString *> *selectedNames;
@end

@implementation QKTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageNames = @[ @"tabbar_item1",
                     @"tabbar_item2",
                     @"tabbar_item3",
                     @"tabbar_item4" ];
    _selectedNames =
    @[ @"tabbar_item1_selected",
       @"tabbar_item2_selected",
       @"tabbar_item3_selected",
       @"tabbar_item4_selected" ];
    
    _vcTitles = @[ @"首页", @"电视", @"直播", @"我的" ];
    [self initViewControllers];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.tintColor = RGB(20.0, 130.0, 180.0);
    self.tabBar.translucent = NO;
    self.delegate = self;
}


- (void)initViewControllers {
    NSArray *classNames = @[ @"ViewController",
                             @"ViewController",
                             @"ViewController",
                             @"QKMineController" ];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    [classNames enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if (idx == 3) {
            UIStoryboard *story = [UIStoryboard storyboardWithName:obj bundle:nil];
            UIViewController *vc = [story instantiateViewControllerWithIdentifier:obj];
            [self configureViewController:vc index:idx];
            MNavigationController *nav = [[MNavigationController alloc] initWithRootViewController:vc];
            [viewControllers addObject:nav];
        } else {
            Class class = NSClassFromString(obj);
            UIViewController *vc = [[class alloc] init];
            [self configureViewController:vc index:idx];
            MNavigationController *nav = [[MNavigationController alloc] initWithRootViewController:vc];
            [viewControllers addObject:nav];
        }
    }];
    self.viewControllers = viewControllers;
}

// 配置tabbarItem
- (void)configureViewController:(UIViewController *)viewController index:(NSInteger)index {
    viewController.title            = _vcTitles[index];
    UIImage *normalImage            = [[UIImage imageNamed:_imageNames[index]]
                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage          = [[UIImage imageNamed:_selectedNames[index]]
                                       imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = normalImage;
    viewController.tabBarItem.selectedImage = selectedImage;
}



@end
