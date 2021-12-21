//
//  UIView+ZYToast.h
//  Toast
//
//  Created by zy on 02/11/2021.
//

#import <UIKit/UIKit.h>
#import "ZYToastView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZYToast)

/** show loading and toast default is 努力加载中 */
- (void)zy_showLoading;

/** show loading and toast  */
- (void)zy_showLoadingToast:(NSString *)toast;

/** show loading and toast, type is about backgroundView */
- (void)zy_showLoadingToast:(NSString *)toast
                    type:(ZYToastType)type;

/** show toast */
- (void)zy_showToast:(NSString *)toast;

/** hide */
- (void)zy_hideLoading;

@end

NS_ASSUME_NONNULL_END
