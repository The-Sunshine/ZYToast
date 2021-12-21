//
//  ZYToast.h
//  ZYWeakProxy
//
//  Created by zy on 02/11/2021.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYWeakProxy : NSProxy

@property (nullable, nonatomic, weak, readonly) id target;

- (instancetype)initWithTarget:(id)target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
