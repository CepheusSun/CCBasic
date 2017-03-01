//
//  UIScrollView+HeaderImageScale.m
//  DPHMechart
//
//  Created by 孙扬 on 2016/10/23.
//  Copyright © 2016年 MichealSun. All rights reserved.
//

#import "UIScrollView+HeaderImageScale.h"
#import <objc/runtime.h>
#import "NSObject+MethodSwizzling.h"


static char *const headerImageViewKey = "headerImageViewKey";
static char *const headerImageViewHeight = "headerImageViewHeight";
static char *const isInitialKey = "isInitialKey";

static CGFloat const oriImageH = 200;
@implementation UIScrollView (HeaderImageScale)
@dynamic sy_headerScaleImage;
@dynamic sy_headerImageHeight;
@dynamic sy_isInitial;

+ (void)load {
    [self sy_swizzleInstanceSelector:@selector(setTableHeaderView:) swizzleSelector:@selector(setSy_tableHeaderView:)];
}

- (void)setSy_tableHeaderView:(UIView *)tableHeaderView {
    if (![self isMemberOfClass:[UITableView class]]) {
        return;
    }
    [self setSy_tableHeaderView:tableHeaderView];
    UITableView *tableView = (UITableView *)self;
    self.sy_headerImageHeight = tableView.tableHeaderView.frame.size.height;
}


- (UIImageView *)sy_headerImageView {
    UIImageView *imageView = objc_getAssociatedObject(self, headerImageViewKey);
    if (imageView == nil) {
        imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self insertSubview:imageView atIndex:0];
        objc_setAssociatedObject(self, headerImageViewKey, imageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return imageView;
}

- (BOOL)sy_isInitial {
    return (BOOL)objc_getAssociatedObject(self, isInitialKey);
}

- (void)setSy_isInitial:(BOOL)sy_isInitial {
    objc_setAssociatedObject(self, isInitialKey, @(sy_isInitial),OBJC_ASSOCIATION_ASSIGN);
}

- (void)setSy_headerImageHeight:(CGFloat)sy_headerImageHeight {
    objc_setAssociatedObject(self, headerImageViewHeight, @(sy_headerImageHeight),OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self setupHeaderImageViewFrame];
}

- (CGFloat)sy_headerImageHeight {
    CGFloat headerImageHeight = [objc_getAssociatedObject(self, headerImageViewHeight) floatValue];
    return headerImageHeight == 0 ? oriImageH:headerImageHeight;
}

- (void)setSy_headerScaleImage:(UIImage *)sy_headerScaleImage {
    self.sy_headerImageView.image = sy_headerScaleImage;
    [self setupHeaderImageView];
}

- (void)setupHeaderImageViewFrame {
    self.sy_headerImageView.frame = CGRectMake(0 , 0, self.bounds.size.width , self.sy_headerImageHeight);
    
}

- (void)setupHeaderImageView {
    [self setupHeaderImageViewFrame];
    if (self.sy_isInitial == NO) {
        [self addObserver:self forKeyPath:SYKeyPath(self, contentOffset) options:NSKeyValueObservingOptionNew context:nil];
        self.sy_isInitial = YES;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    CGFloat offsetY = self.contentOffset.y;
    if (offsetY < 0) {
        self.sy_headerImageView.frame = CGRectMake(offsetY, offsetY, self.bounds.size.width - offsetY * 2, self.sy_headerImageHeight - offsetY);
    } else {
        self.sy_headerImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.sy_headerImageHeight);
    }
}

@end
