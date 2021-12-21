//
//  ZYToast.h
//  Toast
//
//  Created by zy on 02/11/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZYToastType) {
    ZYToastTypeLoadingWithBG,
    ZYToastTypeLoadingWithoutBG,
};

@interface ZYToastView : UIView

- (instancetype)initWithToastType:(ZYToastType)type
                            toast:(NSString *)toast;


@end


NS_ASSUME_NONNULL_END
