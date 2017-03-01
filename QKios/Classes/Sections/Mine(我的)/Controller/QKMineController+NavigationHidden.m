//
//  QKMineController+NavigationHidden.m
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKMineController+NavigationHidden.h"
@import ObjectiveC.runtime;

@implementation QKMineController (NavigationHidden)

+ (void)load {
    [self sy_swizzleInstanceSelector:@selector(viewWillAppear:) swizzleSelector:@selector(cc_ViewWillAppear:)];
    [self sy_swizzleInstanceSelector:@selector(viewWillDisappear:) swizzleSelector:@selector(cc_ViewWillDisappear:)];
    [self sy_swizzleInstanceSelector:@selector(viewDidLoad) swizzleSelector:@selector(cc_ViewDidLoad)];
    [self sy_swizzleInstanceSelector:@selector(scrollViewDidScroll:) swizzleSelector:@selector(cc_scrollViewDidScroll:)];
        [self sy_swizzleInstanceSelector:@selector(viewDidAppear:) swizzleSelector:@selector(cc_viewDidAppear:)];
}

- (void)cc_ViewDidLoad {
    [self cc_ViewDidLoad];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (self.view.frame.size.width), 44)];
    self.navigationItem.titleView = v;
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = nil;
    self.progressLayer.lineWidth = 1.5;
    self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.frame = CGRectMake((self.view.frame.size.width-25)/2.0, 11, 20, 20);
    [self.navigationItem.titleView.layer addSublayer:self.progressLayer];

}

- (void)cc_ViewWillAppear:(BOOL)animated {
    [self cc_ViewWillAppear:animated];
    self.navigationItem.leftBarButtonItem.customView.alpha = 1;
    self.navigationItem.titleView.alpha = 1;
    self.navigationItem.rightBarButtonItem.customView.alpha = 1;
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)configContentOffset {
    if (self.tableView.contentOffset.y > 60) {
        [self.navigationController setNavigationBarHidden:YES animated:NO];return;
    };
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)cc_viewDidAppear:(BOOL)animated {
    [self cc_viewDidAppear:animated];
    [self configContentOffset];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)cc_ViewWillDisappear:(BOOL)animated {
    [self cc_ViewWillDisappear:animated];
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:1];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)cc_scrollViewDidScroll:(UIScrollView *)scrollView {
    [self cc_scrollViewDidScroll:scrollView];
    [self configContentOffset];
    if (!self.isLoading) {
        int y = - scrollView.contentOffset.y;
        if (self.tableView.isDragging) {
            if(y < 80){
                float percent = y/80.0;
                if(percent > 0.90) percent = 0.90;
                float radius = self.progressLayer.frame.size.width/2.0;
                if (percent > 0) {
                    self.progressLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:-M_PI_2 endAngle:(M_PI * 2) * percent - M_PI_2 clockwise:YES].CGPath;
                } else {
                    self.progressLayer.path = nil;
                }
            } else{
                if( y >= 80 ){//触发刷新状态
                    self.isLoading = YES;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [self endUpdating];
                    });
                    [self addAnimationLayer:self.progressLayer];
                }
                else{
                    self.progressLayer.path = nil;
                }
            }
        }else {
            if (!self.isLoading) {
                float percent = y/80.0;
                if(percent > 0.90) percent = 0.90;
                float radius = self.progressLayer.frame.size.width/2.0;
                if (percent > 0.1) {
                    self.progressLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius startAngle:-M_PI_2 endAngle:(M_PI * 2) * percent - M_PI_2 clockwise:YES].CGPath;
                } else {
                    self.progressLayer.path = nil;
                }
            }
        }
    }
}

#pragma mark - 刷新动画
-(void)addAnimationLayer:(CALayer *)layer{
    [layer removeAllAnimations];
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.3f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    [layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)endUpdating{
    if (self.isLoading) {
        self.isLoading = NO;
        self.progressLayer.path = nil;
        [self.progressLayer removeAllAnimations];
    }
}

#pragma mark - binding
static const char * QKMineController_NavigationHidden_ProgressKey = "QKMineController_NavigationHidden_ProgressKey";
- (void)setProgressLayer:(CAShapeLayer *)grogressLayer {
    objc_setAssociatedObject(self, QKMineController_NavigationHidden_ProgressKey, grogressLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)progressLayer {
   return objc_getAssociatedObject(self, QKMineController_NavigationHidden_ProgressKey);
}

static const char * QKMineController_NavigationHidden_isLoadingKey = "QKMineController_NavigationHidden_isLoadingKey";
- (void)setIsLoading:(BOOL)isLoading {
    NSNumber *num = @(1);
    if (!isLoading) {
        num = @(0);
    }
    objc_setAssociatedObject(self, QKMineController_NavigationHidden_isLoadingKey, num, OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLoading {
    return [objc_getAssociatedObject(self, QKMineController_NavigationHidden_isLoadingKey) boolValue];
}
@end
