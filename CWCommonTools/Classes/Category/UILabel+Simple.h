//
//  UILabel+Simple.h
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Simple)

//背景色
- (UILabel *(^)(void))randomColor;
- (UILabel *(^)(id _Nullable color))bgcolor;
//圆角
- (UILabel *(^)(CGFloat radius))corner;
- (UILabel *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner;
//边框
- (UILabel *(^)(id _Nullable color))borderColor;
- (UILabel *(^)(CGFloat width))borderWidth;
//显示与隐藏
- (UILabel *)hide0;
- (UILabel *)hide1;


//字体
- (UILabel *(^)(CGFloat fontSize))sysfont;
- (UILabel *(^)(CGFloat fontSize))medium;
- (UILabel *(^)(CGFloat fontSize))semibold;
- (UILabel *(^)(CGFloat fontSize))bold;
//字体颜色
- (UILabel *(^)(id _Nullable color))tcolor;
//内容
- (UILabel *(^)(id _Nullable text))t;
- (UILabel *(^)(NSAttributedString * _Nullable text))attr;
//文字位置
- (UILabel *)alignLeft;
- (UILabel *)alignCenter;
- (UILabel *)alignRight;
//多行
- (UILabel *(^)(int num))numLine;
/// 创建UILabel
/// @param textColor UILabel文字颜色
/// @param textAlignment TextAlignment
/// @param textFont UILabel字体
/// @param text UILabel文字
+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
