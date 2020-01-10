//
//  YSAlertAppearance.h
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YSAlertAppearanceProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface YSAlertAppearance : NSObject<YSAlertAppearanceProtocol>
+ (instancetype)appearance;
+ (instancetype)alloc NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;

/*
 全局配置表应用，如果自定义配置样式 必须调用
 */
- (void)applyConfig:(NSObject<YSAlertAppearanceProtocol> *)config;

@end

NS_ASSUME_NONNULL_END
