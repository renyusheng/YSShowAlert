//
//  YSAlertAppearance.m
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import "YSAlertAppearance.h"

#ifndef RGBA
    #define RGBA(r, g, b, a) ([UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:a])
#endif

#define screen_h [UIScreen mainScreen].bounds.size.height

#define kRightBtnColor RGBA(20, 168, 62, 1)
#define kLeftBtnColor RGBA(123, 127, 131, 1)

@interface YSAlertAppearance ()
///遵循OLEAlertAppearanceProtocol协议的 实例对象，注意不是 delegate
@property (nonatomic, strong) NSObject<YSAlertAppearanceProtocol> *config;
@end

@implementation YSAlertAppearance

+ (instancetype)appearance {
    static YSAlertAppearance *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super alloc] init];
    });
    return _instance;
}

- (void)applyConfig:(id<YSAlertAppearanceProtocol>)config {
    self.config = config;
}

- (UIColor *)ole_titleTextColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_titleTextColor];
    }
    return RGBA(43, 45, 51, 1);
}

- (UIColor *)ole_contentTextColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_contentTextColor];
    }
    return RGBA(79, 84, 90, 1);
}

- (UIColor *)ole_leftActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_leftActionTitleColor];
    }
    return kLeftBtnColor;
}

- (UIColor *)ole_rightActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_rightActionTitleColor];
    }
    return kRightBtnColor;
}

- (UIColor *)ole_floatActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_floatActionTitleColor];
    }
    return [UIColor whiteColor];
}

- (UIColor *)ole_floatActionBackgroundColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_floatActionBackgroundColor];
    }
    return RGBA(65, 95, 255, 1);
}

- (UIColor *)ole_floatActionBackgroundHighlightColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_floatActionBackgroundHighlightColor];
    }
    return RGBA(60, 90, 250, 1);
}

- (UIFont *)ole_titleTextFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_titleTextFont];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:16];
}

- (UIFont *)ole_contentTextFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_contentTextFont];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:14];
}

- (UIFont *)ole_leftActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_leftActionTitleFont];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:16];
}

- (UIFont *)ole_rightActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_rightActionTitleFont];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:16];
}

- (UIFont *)ole_floatActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_floatActionTitleFont];
    }
    return [UIFont fontWithName:@"PingFangSC-Regular" size:16];
}

- (NSTextAlignment)ole_contentTextAlignment {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_contentTextAlignment];
    }
    return NSTextAlignmentCenter;
}


- (UIColor *)ole_sheetFirstActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetFirstActionTitleColor];
    }
    return [UIColor blackColor];
}

- (UIColor *)ole_sheetSecondActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetSecondActionTitleColor];
    }
    return [UIColor blackColor];
}

- (UIColor *)ole_sheetCancelActionTitleColor {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetCancelActionTitleColor];
    }
    return [UIColor blackColor];
}

- (UIFont *)ole_sheetFirstActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetFirstActionTitleFont];
    }
    return [UIFont systemFontOfSize:15];
}

- (UIFont *)ole_sheetSecondActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetSecondActionTitleFont];
    }
    return [UIFont systemFontOfSize:15];
}

- (UIFont *)ole_sheetCancelActionTitleFont {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetCancelActionTitleFont];
    }
    return [UIFont boldSystemFontOfSize:17];
}

- (NSString *)ole_sheetCancelActionTitle {
    if (self.config && [self.config respondsToSelector:_cmd]) {
       return [self.config ys_sheetCancelActionTitle];
    }
    return @"取消";
}

@end
