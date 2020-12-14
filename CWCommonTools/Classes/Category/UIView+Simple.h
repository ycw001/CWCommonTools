//
//  UIView+Simple.h
//  CWCommonTools
//
//  Created by CW on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Simple)

//初始化
+ (instancetype)view;

//背景色
- (UIView *(^)(void))randomColor;
- (UIView *(^)(id _Nullable color))bgcolor;
//圆角
- (UIView *(^)(CGFloat radius))corner;
- (UIView *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner;
//边框
- (UIView *(^)(id _Nullable color))borderColor;
- (UIView *(^)(CGFloat width))borderWidth;
//显示与隐藏
- (UIView *)hide0;
- (UIView *)hide1;

@end

NS_ASSUME_NONNULL_END
