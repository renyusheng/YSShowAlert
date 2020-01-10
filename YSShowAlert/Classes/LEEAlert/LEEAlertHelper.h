/*!
 *  @header LEEAlertHelper.h
 *
 *  ┌─┐      ┌───────┐ ┌───────┐ 帅™
 *  │ │      │ ┌─────┘ │ ┌─────┘
 *  │ │      │ └─────┐ │ └─────┐
 *  │ │      │ ┌─────┘ │ ┌─────┘
 *  │ └─────┐│ └─────┐ │ └─────┐
 *  └───────┘└───────┘ └───────┘
 *
 *  @brief  LEEAlertHelper
 *
 *  @author LEE
 *  @fixed by keymon  
 *  @copyright Copyright © 2016 - 2018年 lee. All rights reserved.
 *  @version V1.2.1
 *  @warning    已经根据项目需求，对本三方弹窗做了修改，详情可以全局搜索"///!!!:自定义需求"，所以不要用cocoapods管理，也不要更新本三方
 */

#ifndef LEEAlertHelper_h
#define LEEAlertHelper_h

#ifndef le_weakify
    #if DEBUG
        #define le_weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
    #else
        #define le_weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
    #endif
#endif

#ifndef le_strongify
    #if DEBUG
        #define le_strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
    #else
        #define le_strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
    #endif
#endif


FOUNDATION_EXPORT double LEEAlertVersionNumber;
FOUNDATION_EXPORT const unsigned char LEEAlertVersionString[];

@class LEEAlert, LEEAlertConfig, LEEAlertConfigModel, LEEAlertWindow, LEEAction, LEEItem, LEECustomView;

typedef NS_ENUM(NSInteger, LEEScreenOrientationType) {
    /** 屏幕方向类型 横屏 */
    LEEScreenOrientationTypeHorizontal,
    /** 屏幕方向类型 竖屏 */
    LEEScreenOrientationTypeVertical
};

typedef NS_ENUM(NSInteger, LEEAlertType) {
    LEEAlertTypeAlert,
    LEEAlertTypeActionSheet
};

typedef NS_ENUM(NSInteger, LEEActionType) {
    /** 默认 */
    LEEActionTypeDefault,
    /** 取消 */
    LEEActionTypeCancel,
    /** 销毁 */
    LEEActionTypeDestructive
};

typedef NS_OPTIONS(NSInteger, LEEActionBorderPosition) {
    /** Action边框位置 上 */
    LEEActionBorderPositionTop      = 1 << 0,
    /** Action边框位置 下 */
    LEEActionBorderPositionBottom   = 1 << 1,
    /** Action边框位置 左 */
    LEEActionBorderPositionLeft     = 1 << 2,
    /** Action边框位置 右 */
    LEEActionBorderPositionRight    = 1 << 3
};

typedef NS_ENUM(NSInteger, LEEItemType) {
    /** 标题 */
    LEEItemTypeTitle,
    /** 内容 */
    LEEItemTypeContent,
    /** 输入框 */
    LEEItemTypeTextField,
    /** 自定义视图 */
    LEEItemTypeCustomView,
    
    LEEItemTypeImage, ///< !!!:自定义需求 新增,提示占位图片
};

typedef NS_ENUM(NSInteger, LEECustomViewPositionType) {
    /** 居中 */
    LEECustomViewPositionTypeCenter,
    /** 靠左 */
    LEECustomViewPositionTypeLeft,
    /** 靠右 */
    LEECustomViewPositionTypeRight
};

typedef NS_OPTIONS(NSInteger, LEEAnimationStyle) {
    /** 动画样式方向 默认 */
    LEEAnimationStyleOrientationNone    = 1 << 0,
    /** 动画样式方向 上 */
    LEEAnimationStyleOrientationTop     = 1 << 1,
    /** 动画样式方向 下 */
    LEEAnimationStyleOrientationBottom  = 1 << 2,
    /** 动画样式方向 左 */
    LEEAnimationStyleOrientationLeft    = 1 << 3,
    /** 动画样式方向 右 */
    LEEAnimationStyleOrientationRight   = 1 << 4,
    
    /** 动画样式 淡入淡出 */
    LEEAnimationStyleFade               = 1 << 12,
    
    /** 动画样式 缩放 放大 */
    LEEAnimationStyleZoomEnlarge        = 1 << 24,
    /** 动画样式 缩放 缩小 */
    LEEAnimationStyleZoomShrink         = 2 << 24,
};

typedef LEEAlertConfigModel * _Nonnull (^LEEConfig)(void);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToBool)(BOOL is);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToInteger)(NSInteger number);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToFloat)(CGFloat number);
///!!!:自定义需求
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToImage)(UIImage *image);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToString)(NSString *str);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToView)(UIView *view);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToColor)(UIColor *color);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToSize)(CGSize size);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToEdgeInsets)(UIEdgeInsets insets);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToAnimationStyle)(LEEAnimationStyle style);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToBlurEffectStyle)(UIBlurEffectStyle style);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToInterfaceOrientationMask)(UIInterfaceOrientationMask);
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToFloatBlock)(CGFloat(^_Nullable)(LEEScreenOrientationType type));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToAction)(void(^_Nullable)(LEEAction * _Nonnull action));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToCustomView)(void(^_Nullable)(LEECustomView * _Nonnull custom));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToStringAndBlock)(NSString *str , void (^_Nullable)(void));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToConfigLabel)(void(^_Nullable)(UILabel * _Nonnull label));
///!!!:自定义需求
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToConfigImage)(void(^_Nullable)(UIImageView * _Nonnull imageView));

typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToConfigTextField)(void(^)(UITextField * _Nonnull textField));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToItem)(void(^)(LEEItem * _Nonnull item));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToBlock)(void(^block)(void));
typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToBlockAndBlock)(void(^)(void (^animatingBlock)(void) , void (^animatedBlock)(void)));

typedef LEEAlertConfigModel * _Nonnull (^LEEConfigToStatusBarStyle)(UIStatusBarStyle style);

#endif /* LEEAlertHelper_h */

