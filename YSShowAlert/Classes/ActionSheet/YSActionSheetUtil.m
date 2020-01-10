//
//  YSActionSheetUtil.m
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import "YSActionSheetUtil.h"
#import "LEEAlert.h"
//#import <LEEAlert/LEEAlert.h>
//#import "LEEAlert/LEEAlert.h"
#import "YSAlertAppearance.h"
@implementation YSActionSheetUtil

+ (void)showSheetWithView:(UIView *)view {
    [LEEAlert actionsheet].config
    .LeeAddCustomView(^(LEECustomView * _Nonnull custom) {
        custom.view = view;
        custom.isAutoWidth = YES;
    })
    .LeeItemInsets(UIEdgeInsetsZero)
    .LeeClickBackgroundClose(NO)
    .LeeHeaderInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeActionSheetBottomMargin(0.0)
    .LeeActionSheetBackgroundColor([UIColor whiteColor])
    .LeeCornerRadius(0.0f)
    .LeeConfigMaxWidth(^CGFloat(LEEScreenOrientationType type) {
        // 这是最大宽度为屏幕宽度 (横屏和竖屏)
        return CGRectGetWidth([[UIScreen mainScreen] bounds]);
    })
    .LeeShow();
}

+ (void)showSheetWithTwoActions:(NSArray<NSString *> *)actions block:(void (^)(NSInteger))block
{
    [LEEAlert actionsheet].config
    .LeeClickBackgroundClose(NO)
    .LeeAddAction(^(LEEAction *action) {
        action.title = actions[0];
        action.titleColor = [[YSAlertAppearance appearance] ys_sheetFirstActionTitleColor];
        action.font = [[YSAlertAppearance appearance] ys_sheetFirstActionTitleFont];
        // 点击事件Block
        action.clickBlock = ^{
            if (block) {
                block(0);
            }
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        action.title = actions[1];
        action.titleColor = [[YSAlertAppearance appearance] ys_sheetSecondActionTitleColor];
        action.font = [[YSAlertAppearance appearance] ys_sheetSecondActionTitleFont];
        // 点击事件Block
        action.clickBlock = ^{
            if (block) {
                block(1);
            }
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        action.type = LEEActionTypeCancel;
        action.title = [[YSAlertAppearance appearance] ys_sheetCancelActionTitle];
        action.titleColor = [[YSAlertAppearance appearance] ys_sheetCancelActionTitleColor];
        action.font = [[YSAlertAppearance appearance] ys_sheetCancelActionTitleFont];
    })
    .LeeShow();
}

+ (void)showSheetWithOneAction:(NSString *)actionTitle block:(void (^)(void))block
{
    [LEEAlert actionsheet].config
    .LeeClickBackgroundClose(NO)
    .LeeAddAction(^(LEEAction *action) {
        action.title = actionTitle;
        action.titleColor = [[YSAlertAppearance appearance] ys_sheetFirstActionTitleColor];
        action.font = [[YSAlertAppearance appearance] ys_sheetFirstActionTitleFont];
        // 点击事件Block
        action.clickBlock = ^{
            if (block) {
                block();
            }
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        action.type = LEEActionTypeCancel;
        action.title = [[YSAlertAppearance appearance] ys_sheetCancelActionTitle];
        action.titleColor = [[YSAlertAppearance appearance] ys_sheetCancelActionTitleColor];
        action.font = [[YSAlertAppearance appearance] ys_sheetCancelActionTitleFont];
    })
    .LeeShow();
}


+ (void)dismissWithCompletionBlock:(void (^)(void))completionBlock {
    [LEEAlert closeWithCompletionBlock:^{
        !completionBlock ?: completionBlock();
    }];
}


@end

