//
//  UIView+ZYToast.m
//  Toast
//
//  Created by zy on 02/11/2021.
//

#import "UIView+ZYToast.h"
#import "UIView+Toast.h"
#import "ZYToast.h"

@implementation UIView (ZYToast)

- (void)zy_showLoading {
    [self zy_showLoadingToast:@"努力加载中"
                      type:ZYToastTypeLoadingWithBG];
}

- (void)zy_showLoadingToast:(NSString *)toast {
    [self zy_showLoadingToast:toast
                      type:ZYToastTypeLoadingWithBG];
}

- (void)zy_showLoadingToast:(NSString *)toast
                    type:(ZYToastType)type {
    ZYToastView * toastView = [[ZYToastView alloc]
                               initWithToastType:type
                               toast:toast];
    toastView.frame = CGRectMake(0, 0, 150, 160);
    [toastView setAutoresizingMask:
     (UIViewAutoresizingFlexibleLeftMargin |
      UIViewAutoresizingFlexibleRightMargin |
      UIViewAutoresizingFlexibleTopMargin |
      UIViewAutoresizingFlexibleBottomMargin)];
    [self showToast:toastView
           duration:ZYLoadingDuration
           position:CSToastPositionCenter
         completion:nil];
}

- (void)zy_showToast:(NSString *)toast {
    [self zy_hideLoading];
    [self makeToast:toast
           duration:ZYToastDuration
           position:CSToastPositionCenter];
}

- (void)zy_hideLoading {
    [self hideAllToasts];
}

@end
