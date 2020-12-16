//
//  UIButton+Simple.h
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ImagePosition) {
    ImagePositionLeft     = 0,            //图片在左，文字在右，默认
    ImagePositionRight    = 1,            //图片在右，文字在左
    ImagePositionTop      = 2,            //图片在上，文字在下
    ImagePositionBottom   = 3,            //图片在下，文字在上
};

@interface UIButton (Simple)

//初始化
+ (instancetype)button;
//背景色
- (UIButton *(^)(void))randomColor;
- (UIButton *(^)(id _Nullable color))bgcolor;
//圆角
- (UIButton *(^)(CGFloat radius))corner;
- (UIButton *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner;
//边框
- (UIButton *(^)(id _Nullable color))borderColor;
- (UIButton *(^)(CGFloat width))borderWidth;
//显示与隐藏
- (UIButton *)hide0;
- (UIButton *)hide1;


//设置图片
- (UIButton *(^)(id _Nullable image))normalImg;
- (UIButton *(^)(id _Nullable image))highlightedImg;
- (UIButton *(^)(id _Nullable image))disabledImg;
- (UIButton *(^)(id _Nullable image))selectedImg;
//字体
- (UIButton *(^)(CGFloat fontSize))sysfont;
- (UIButton *(^)(CGFloat fontSize))medium;
- (UIButton *(^)(CGFloat fontSize))semibold;
//字体颜色
- (UIButton *(^)(id _Nullable color))normalColor;
- (UIButton *(^)(id _Nullable color))highlightedColor;
- (UIButton *(^)(id _Nullable color))disabledColor;
- (UIButton *(^)(id _Nullable color))selectedColor;
//设置文字
- (UIButton *(^)(NSString * _Nullable text))normalText;
- (UIButton *(^)(NSString * _Nullable text))highlightedText;
- (UIButton *(^)(NSString * _Nullable text))disabledText;
- (UIButton *(^)(NSString * _Nullable text))selectedText;
//事件
- (UIButton *(^)(id target, SEL selector))action;

/// 创建UIButton
/// @param titleColor 按钮文字颜色
/// @param contentAlig UIControlContentHorizontalAlignment
/// @param titleFont 按钮文字字体
/// @param title 按钮文字
+ (UIButton  *)creatNormalButton:(UIColor *)titleColor contentAlig:(UIControlContentHorizontalAlignment)contentAlig font:(UIFont *)titleFont title:(NSString *)title;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：在设置图片和文字之后，并且button的size不能为0调用本方法才能计算出正确的偏移量。
    本次更新此方法已经适配了button的宽度小于 imageView+titleLable宽度和的情况，但是button的大小至少要大于图片的大小。
    每次修改button文字后都要再调用一下该方法，否则排版可能会混乱。
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)btn_setImagePosition:(ImagePosition)postion spacing:(CGFloat)spacing;


/**
 扩大按钮的点击范围
 */

- (void)setEnlargeEdge:(CGFloat) size;

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end

NS_ASSUME_NONNULL_END
