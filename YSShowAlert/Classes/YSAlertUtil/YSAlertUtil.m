//
//  YSAlertUtil.m
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import "YSAlertUtil.h"
#import "LEEAlert.h"
#import "YSAlertAppearance.h"

#ifndef screen_w
#define screen_w [UIScreen mainScreen].bounds.size.width
#endif
static CGFloat const kAlertMaxWidth = 270;
//类方法中不能访问属性，但是可以访问静态全局变量
static dispatch_block_t _linkBlock;
@interface YSAlertUtil ()

@end
@implementation YSAlertUtil

+ (void)showAlertForOneImgOneBtnWithImg:(UIImage *)img
                              showClose:(BOOL)showClose
                                  title:(NSString *)title
                            actionTitle:(NSString *)actionTitle
                                content:(NSString *)content
                                handler:(dispatch_block_t)handler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeShouldShowCloseBtn(showClose)
    .LeeImage(img)
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 0, 10, 0) : UIEdgeInsetsZero)
    .LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = title;
        label.font = [[YSAlertAppearance appearance] ys_titleTextFont];
        label.textColor = [[YSAlertAppearance appearance] ys_titleTextColor];
    })
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 16, 6, 16) : UIEdgeInsetsMake(0, 0, 10, 0))
    .LeeAddContent(^(UILabel *label) {
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        if ([self isMultipleLineContent:content]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        label.text = content;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.title = actionTitle;
        action.font = [[YSAlertAppearance appearance] ys_rightActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_rightActionTitleColor];
        action.clickBlock = ^{
            if (handler) {
                handler();
            }
        };
    })
    .LeeShow();
}

+ (void)showAlertForOneImgTwoBtnWithImg:(UIImage *)img
                              showClose:(BOOL)showClose
                                  title:(NSString *)title
                                    msg:(NSString *)msg
                          leftBtnTitle:(NSString *)leftBtnTitle
                         rightBtnTitle:(NSString *)rightBtnTitle
                           leftHandler:(dispatch_block_t)leftHandler
                          rightHandler:(dispatch_block_t)rightHandler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeShouldShowCloseBtn(showClose)
    .LeeImage(img)
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 0, 10, 0) : UIEdgeInsetsZero)
    .LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = title;
        label.font = [[YSAlertAppearance appearance] ys_titleTextFont];
        label.textColor = [[YSAlertAppearance appearance] ys_titleTextColor];
    })
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 16, 6, 16) : UIEdgeInsetsMake(0, 0, 10, 0))
    .LeeAddContent(^(UILabel * _Nonnull label) {
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        if ([self isMultipleLineContent:msg]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        label.text = msg;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = leftBtnTitle;
        action.font = [[YSAlertAppearance appearance] ys_leftActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_leftActionTitleColor];
        
        action.clickBlock = ^{
            if (leftHandler) {
                leftHandler();
            }
        };
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = rightBtnTitle;
        action.font = [[YSAlertAppearance appearance] ys_rightActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_rightActionTitleColor];
        
        action.clickBlock = ^{
            if (rightHandler) {
                rightHandler();
            }
        };
    })
    .LeeShow();
}

+ (void)showAlertForTwoButtonWithTitle:(NSString *)title
                                   msg:(NSString *)msg
                         leftBtnTitle:(NSString *)leftBtnTitle
                        rightBtnTitle:(NSString *)rightBtnTitle
                       leftHandler:(dispatch_block_t)leftHandler
                      rightHandler:(dispatch_block_t)rightHandler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = title;
        label.font = [[YSAlertAppearance appearance] ys_titleTextFont];
        label.textColor = [[YSAlertAppearance appearance] ys_titleTextColor];
    })
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 16, 6, 16) : UIEdgeInsetsMake(0, 0, 10, 0))
    .LeeAddContent(^(UILabel *label) {
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        if ([self isMultipleLineContent:msg]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:msg];
        label.attributedText = attr;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = leftBtnTitle;
        action.font = [[YSAlertAppearance appearance] ys_leftActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_leftActionTitleColor];
        
        action.clickBlock = ^{
            if (leftHandler) {
                leftHandler();
            }
        };
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = rightBtnTitle;
        action.font = [[YSAlertAppearance appearance] ys_rightActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_rightActionTitleColor];
        
        action.clickBlock = ^{
            if (rightHandler) {
                rightHandler();
            }
        };
    })
    .LeeShow();
}

+ (void)showAlertForOneBtnWithTitle:(NSString *)title
                            content:(NSString *)content
                        actionTitle:(NSString *)actionTitle
                            handler:(dispatch_block_t)handler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = title;
        label.font = [[YSAlertAppearance appearance] ys_titleTextFont];
        label.textColor = [[YSAlertAppearance appearance] ys_titleTextColor];
    })
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 16, 6, 16) : UIEdgeInsetsMake(0, 0, 10, 0))
    .LeeAddContent(^(UILabel *label) {
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        if ([self isMultipleLineContent:content]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:content];
        label.attributedText = attr;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = actionTitle;
        action.font = [[YSAlertAppearance appearance] ys_rightActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_rightActionTitleColor];
        
        action.clickBlock = ^{
            if (handler) {
                handler();
            }
        };
    })
    .LeeShow();
}

+ (void)showAlertWithImg:(UIImage *)img
                 content:(NSAttributedString *)content
             actionTitle:(NSString *)actionTitle
             actionBlock:(dispatch_block_t)actionBlock
               linkBlock:(dispatch_block_t)linkBlock
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeImage(img)
    .LeeAddContent(^(UILabel *label) {
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        if ([self isMultipleLineContent:content.string]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        label.attributedText = content;
        
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [label addGestureRecognizer:tapGR];
        
        _linkBlock = linkBlock;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeCancel;
        action.title = actionTitle;
        action.font = [[YSAlertAppearance appearance] ys_leftActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_leftActionTitleColor];
        action.clickBlock = ^{
            if (actionBlock) {
                actionBlock();
            }
        };
    })
    .LeeShow();
}

+ (void)showAlertWithImg:(UIImage *)img
               showClose:(BOOL)showClose
                     msg:(NSAttributedString *)msg
             actionTitle:(NSString *)actionTitle
                 handler:(dispatch_block_t)handler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeShouldShowCloseBtn(showClose)
    .LeeImage(img)
    .LeeAddContent(^(UILabel *label) {
        if ([self isMultipleLineContent:msg.string]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        label.attributedText = msg;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.title = actionTitle;
        action.font = [[YSAlertAppearance appearance] ys_rightActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_rightActionTitleColor];
        action.clickBlock = ^{
            if (handler) {
                handler();
            }
        };
    })
    .LeeShow();
}

+ (void)showCustomView:(UIView *)aView clickBgClose:(BOOL)clickBgClose
{
    //这里 alert 只是一个容器，任何 view 设置都在子 view 里面设置好，比如 圆角 啥的
    [LEEAlert alert].config
    .LeeClickBackgroundClose(clickBgClose)
//    .LeeCustomView(aView)
    .LeeAddCustomView(^(LEECustomView * _Nonnull custom) {
        custom.view = aView;
        //感觉isAutoWidth有问题
//        custom.isAutoWidth = YES;
    })
    .LeeCornerRadius(0) //必须设置 0，不然影响弹出的子view
    .LeeHeaderInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeHeaderColor([UIColor clearColor])
    .LeeShow();
}

+ (void)showAlertWithTitle:(NSString *)title
                   content:(NSAttributedString *)content
          floatActionTitle:(NSString *)floatActionTitle
              floatHandler:(dispatch_block_t)floatHandler
{
    [LEEAlert alert].config
    .LeeMaxWidth(kAlertMaxWidth)
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [self animateOpenWithAnimatingBlock:animatingBlock animatedBlock:animatedBlock];
    })
    .LeeAddTitle(^(UILabel * _Nonnull label) {
        label.text = title;
        label.font = [[YSAlertAppearance appearance] ys_titleTextFont];
        label.textColor = [[YSAlertAppearance appearance] ys_titleTextColor];
    })
    .LeeItemInsets((title.length > 0) ? UIEdgeInsetsMake(0, 16, 6, 16) : UIEdgeInsetsMake(0, 0, 10, 0))
    .LeeAddContent(^(UILabel *label) {
        if ([self isMultipleLineContent:content.string]) {
            label.textAlignment = NSTextAlignmentJustified;
        } else {
            label.textAlignment = [[YSAlertAppearance appearance] ys_contentTextAlignment];
        }
        label.textColor = [[YSAlertAppearance appearance] ys_contentTextColor];
        label.font = [[YSAlertAppearance appearance] ys_contentTextFont];
        label.attributedText = content;
    })
    .LeeAddAction(^(LEEAction * _Nonnull action) {
        action.type = LEEActionTypeDefault;
        action.insets = UIEdgeInsetsMake(0, 16, 16, 16);
        action.cornerRadius = 4;
        action.title = floatActionTitle;
        action.font = [[YSAlertAppearance appearance] ys_floatActionTitleFont];
        action.titleColor = [[YSAlertAppearance appearance] ys_floatActionTitleColor];
        action.backgroundColor = [[YSAlertAppearance appearance] ys_floatActionBackgroundColor];
        action.backgroundHighlightColor = [[YSAlertAppearance appearance] ys_floatActionBackgroundHighlightColor];
        action.clickBlock = ^{
            if (floatHandler) {
                floatHandler();
            }
        };
    })
    .LeeShow();
}

#pragma mark - tap label event, private method

+ (void)tapLabel:(UITapGestureRecognizer *)sender {
    [LEEAlert closeWithCompletionBlock:^{
        if (_linkBlock) {
            _linkBlock();
        }
    }];
}

#pragma mark - private 动画打开弹窗

+ (void)animateOpenWithAnimatingBlock:(void (^)(void))animatingBlock animatedBlock:(void (^)(void))animatedBlock
{
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:20
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         animatingBlock();
                     }
                     completion:^(BOOL finished) {
                         animatedBlock();
                     }];
}

+ (void)dismissWithCallback:(dispatch_block_t)callback {
    [LEEAlert closeWithCompletionBlock:^{
        if (callback) {
            callback();
        }
    }];
}

// 内容多行文本
+ (BOOL)isMultipleLineContent:(NSString *)content {
    CGFloat sinleLineH = [self getStringHeightWithText:@"单行文本高度"
                                                  font:[[YSAlertAppearance appearance] ys_contentTextFont]
                                                 width:kAlertMaxWidth-16*2];
    CGFloat realH = [self getStringHeightWithText:content
                                             font:[[YSAlertAppearance appearance] ys_contentTextFont]
                                            width:kAlertMaxWidth-16*2];
    return realH > sinleLineH;
}

+ (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    if (text.length > 0) {
        NSDictionary *attrs = @{NSFontAttributeName : font};
        CGSize maxSize = CGSizeMake(width, MAXFLOAT);
        NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
        return ceilf(size.height);
    } else {
        return 0.0;
    }
}

@end
