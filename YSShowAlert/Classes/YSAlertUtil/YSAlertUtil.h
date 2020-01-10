//
//  YSAlertUtil.h
//  YSSeniorAlert
//
//  Created by 任雨生 on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSAlertUtil : NSObject

/**
 一个提示占位图片、一个title、一个文本、一个按钮 的样式

 @param img 提示占位的图片
 @param showClose 弹窗右上角是否显示关闭按钮
 @param title title 可空
 @param actionTitle 按钮title
 @param content 详细提示内容
 @param handler 按钮事件回调
 */
+ (void)showAlertForOneImgOneBtnWithImg:(UIImage *)img
                              showClose:(BOOL)showClose
                              title:(nullable NSString *)title
                            actionTitle:(NSString *)actionTitle
                                content:(NSString *)content
                                handler:(dispatch_block_t)handler;

/**
 一个提示占位图片、一个title、一个文本、两个按钮 的样式
 
 @param img 提示占位的图片
 @param showClose 弹窗右上角是否显示关闭按钮
 @param title title 可空
 @param msg 提示内容
 @param leftBtnTitle 第一个按钮 title
 @param rightBtnTitle 第二个按钮 title
 @param leftHandler 第一个按钮 事件回调
 @param rightHandler 第二个按钮 事件回调
 */
+ (void)showAlertForOneImgTwoBtnWithImg:(UIImage *)img
                              showClose:(BOOL)showClose
                                  title:(nullable NSString *)title
                                    msg:(NSString *)msg
                           leftBtnTitle:(NSString *)leftBtnTitle
                          rightBtnTitle:(NSString *)rightBtnTitle
                            leftHandler:(dispatch_block_t)leftHandler
                           rightHandler:(dispatch_block_t)rightHandler;

/**
 title、msg、带有两个按钮 的样式
 用到的的地方：相机、照片隐私权限；取消呼叫、取消订单；

 @param title 提示 title
 @param msg 提示内容
 @param leftBtnTitle 第一个按钮 title
 @param rightBtnTitle 第二个按钮 title
 @param leftHandler 第一个按钮 事件回调
 @param rightHandler 第二个按钮 事件回调
 */
+ (void)showAlertForTwoButtonWithTitle:(NSString *)title
                                   msg:(NSString *)msg
                          leftBtnTitle:(NSString *)leftBtnTitle
                         rightBtnTitle:(NSString *)rightBtnTitle
                           leftHandler:(dispatch_block_t)leftHandler
                          rightHandler:(dispatch_block_t)rightHandler;

/**
 title、content、一个按钮 的样式
 
 @param title title
 @param content 详细提示内容
 @param actionTitle 按钮title
 @param handler 按钮事件回调
 */
+ (void)showAlertForOneBtnWithTitle:(NSString *)title
                            content:(NSString *)content
                        actionTitle:(NSString *)actionTitle
                            handler:(dispatch_block_t)handler;

/**
 一个提示占位图片、一个文本(并且该文本 label 可点击)、一个按钮 的样式

 @param img 占位提示图片
 @param content 提示内容，富文本
 @param actionTitle 按钮title
 @param linkBlock 点击 文本label 的回调
 */
+ (void)showAlertWithImg:(UIImage *)img
                 content:(NSAttributedString *)content
             actionTitle:(NSString *)actionTitle
             actionBlock:(dispatch_block_t)actionBlock
               linkBlock:(dispatch_block_t)linkBlock;

/**
 一个提示占位图片、一个文本(该文本label不可点击)、一个按钮、是否显示叉号 的样式
 
 @param img 占位提示图片
 @param msg 提示内容，富文本
 @param actionTitle 按钮title
 @param handler 点击 文本label 的回调
 */
+ (void)showAlertWithImg:(UIImage *)img
               showClose:(BOOL)showClose
                     msg:(NSAttributedString *)msg
             actionTitle:(NSString *)actionTitle
                 handler:(dispatch_block_t)handler;

/**
 一个title、一个文本(该文本label不可点击)、一个悬浮按钮 的样式
 
 @param title title
 @param content 提示内容，富文本
 @param floatActionTitle 按钮title
 @param floatHandler 回调
 */
+ (void)showAlertWithTitle:(NSString *)title
                   content:(NSAttributedString *)content
          floatActionTitle:(NSString *)floatActionTitle
              floatHandler:(dispatch_block_t)floatHandler;

/**
 显示一个自定义的 view 到 window 上，上述所有的 api 都可以调用如下方法，把 view 封装好 弹出到 window 上
 */
+ (void)showCustomView:(UIView *)aView clickBgClose:(BOOL)clickBgClose;

/**
 消失当前 alert，并带回调
 */
+ (void)dismissWithCallback:(nullable dispatch_block_t)callback;

@end

NS_ASSUME_NONNULL_END

