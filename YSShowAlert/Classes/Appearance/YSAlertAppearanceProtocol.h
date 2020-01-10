//
//  YSAlertAppearanceProtocol.h
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YSAlertAppearanceProtocol <NSObject>
@optional

/*-------------------------------- alert --------------------------------*/

// color

///标题 文本颜色
- (UIColor *)ys_titleTextColor;
///content 文本颜色
- (UIColor *)ys_contentTextColor;
///取消 样式按钮 title 颜色
- (UIColor *)ys_leftActionTitleColor;
///确认 样式按钮 title 颜色
- (UIColor *)ys_rightActionTitleColor;
///特殊 样式按钮 title 颜色
- (UIColor *)ys_floatActionTitleColor;
///特殊 样式按钮 背景 颜色
- (UIColor *)ys_floatActionBackgroundColor;
///特殊 样式按钮 背景 高亮颜色
- (UIColor *)ys_floatActionBackgroundHighlightColor;

// font

///标题 文本字体
- (UIFont *)ys_titleTextFont;
///content 文本字体
- (UIFont *)ys_contentTextFont;
///取消 样式按钮 title 字体
- (UIFont *)ys_leftActionTitleFont;
///确认 样式按钮 title 字体
- (UIFont *)ys_rightActionTitleFont;
///特殊 样式按钮 title 字体
- (UIFont *)ys_floatActionTitleFont;

// TextAlignment

///content 文本对齐方式
- (NSTextAlignment)ys_contentTextAlignment;


/*-------------------------------- action sheet --------------------------------*/

// color

///自上至下 第1个 action title 颜色
- (UIColor *)ys_sheetFirstActionTitleColor;
///自上至下 第2个 action title 颜色
- (UIColor *)ys_sheetSecondActionTitleColor;
///自上至下 取消 样式按钮 title 颜色
- (UIColor *)ys_sheetCancelActionTitleColor;

// font

///自上至下 第1个 action title 字体
- (UIFont *)ys_sheetFirstActionTitleFont;
///自上至下 第2个 action title 字体
- (UIFont *)ys_sheetSecondActionTitleFont;
///自上至下 取消 样式按钮 title 字体
- (UIFont *)ys_sheetCancelActionTitleFont;

// text

///自上至下 样式按钮 title 文本
- (NSString *)ys_sheetCancelActionTitle;

@end

NS_ASSUME_NONNULL_END
