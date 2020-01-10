//
//  YSActionSheetUtil.h
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface YSActionSheetUtil : NSObject
/**
 显示一个自定义的 sheet
 */
+ (void)showSheetWithView:(UIView *)view;

/*!
 * 两个 action 的 sheet
 */
+ (void)showSheetWithTwoActions:(NSArray<NSString *> *)actions block:(void (^)(NSInteger index))block;

/*!
 * 一个 action 的 sheet
 */
+ (void)showSheetWithOneAction:(NSString *)actionTitle block:(void (^)(void))block;

/**
 消失当前 actionSheet，并带回调
 */
+ (void)dismissWithCompletionBlock:(void (^)(void))completionBlock;
@end

NS_ASSUME_NONNULL_END
