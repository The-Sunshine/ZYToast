//
//  ZYToast.m
//  Toast
//
//  Created by zy on 02/11/2021.
//

#import "ZYToastView.h"
#import <Masonry/Masonry.h>

@interface ZYToastView ()

@property (nonatomic, strong) UIImageView * bgView;

@property (nonatomic, strong) UIImageView * loadingIV;

@property (nonatomic, strong) UILabel * toastLabel;

@end

@implementation ZYToastView

- (void)dealloc {
    [self stopLoadingAnimation];
}

- (instancetype)initWithToastType:(ZYToastType)type
                            toast:(NSString *)toast {
    self = [super init];
    if (self) {
        [self initUIWithType:type toast:toast];
        [self beginLoadingAnimation];
    }
    return self;
}

- (void)initUIWithType:(ZYToastType)type
                 toast:(NSString *)toast {
    if (type != ZYToastTypeLoadingWithoutBG) {
        [self addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    
    [self addSubview:self.loadingIV];
    if (toast.length > 0) {
        [self.loadingIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-15);
        }];
        [self addSubview:self.toastLabel];
        [self.toastLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.loadingIV.mas_bottom).offset(10);
        }];
        self.toastLabel.text = toast;
    } else {
        [self.loadingIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
}

- (void)beginLoadingAnimation {
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2];
    animation.duration = 1;
    animation.cumulative = true;
    animation.removedOnCompletion = NO;
    animation.repeatCount= 300;
    [self.loadingIV.layer addAnimation:animation forKey:@"IndicatorAnimation"];
}

- (void)stopLoadingAnimation {
    [self.loadingIV.layer removeAnimationForKey:@"IndicatorAnimation"];
}

#pragma mark - lazy
- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [[UIImageView alloc] init];
        _bgView.backgroundColor = UIColor.blackColor;
        _bgView.image = [UIImage imageNamed:@"loadingBG"];
    }
    return _bgView;
}

- (UIImageView *)loadingIV {
    if (!_loadingIV) {
        _loadingIV = [[UIImageView alloc] init];
        [UIImage imageNamed:@"yellow_loading"];
    }
    return _loadingIV;
}

- (UILabel *)toastLabel {
    if (!_toastLabel) {
        _toastLabel = [[UILabel alloc] init];
        _toastLabel.text = @"努力加载中";
    }
    return _toastLabel;
}


@end
