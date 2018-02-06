//
//  UIView+Loading.m
//  AlamofireDemo
//
//  Created by Jay on 2018/2/2.
//  Copyright © 2018年 Jay. All rights reserved.
//

#import "UIView+Loading.h"
//#import "MBProgressHUD+iShare.h"
#import <objc/runtime.h>

static char ACTIVITY_INDICATOR_KEY;

@implementation UIView (Loading)

- (UIActivityIndicatorView *)loadingView {
    return objc_getAssociatedObject(self, &ACTIVITY_INDICATOR_KEY);
}

- (void)setLoadingView:(UIActivityIndicatorView *)loadingView {
    objc_setAssociatedObject(self, &ACTIVITY_INDICATOR_KEY, loadingView, OBJC_ASSOCIATION_RETAIN);
}

/**
 展示loading（默认灰色）
 */
- (void)showLoading {
    // 默认展示灰色loading
    [self showLoadingWithColor:[UIColor grayColor]];
}

/**
 展示指定颜色的loading
 
 @param color loading的颜色
 */
- (void)showLoadingWithColor:(UIColor *)color {
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
    self.loadingView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    self.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self addSubview:self.loadingView];
    self.loadingView.color = color;
    [self.loadingView startAnimating];
    self.loadingView.userInteractionEnabled = NO;
}

/**
 移除loading
 */
- (void)removeLoading {
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
}

- (void)hideLoading:(NSString *)msg
{
    [self removeLoading];
    if (msg.length) {
        //[MBProgressHUD MB_showText:msg toView:self];
    }
}

@end
