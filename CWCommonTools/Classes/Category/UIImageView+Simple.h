//
//  UIImageView+Simple.h
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Simple)

//背景色
- (UIImageView *(^)(void))randomColor;
- (UIImageView *(^)(id _Nullable color))bgcolor;
//圆角
- (UIImageView *(^)(CGFloat radius))corner;
- (UIImageView *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner;
//边框
- (UIImageView *(^)(id _Nullable color))borderColor;
- (UIImageView *(^)(CGFloat width))borderWidth;
//显示与隐藏
- (UIImageView *)hide0;
- (UIImageView *)hide1;


//内容填充方式
- (UIImageView *)aspectFit;
- (UIImageView *)aspectFill;
- (UIImageView *)centerMode;
//设置图片
- (UIImageView *(^)(NSString *url,id _Nullable placeholderImage))url;
- (UIImageView *(^)(id _Nullable image))img;

@end

NS_ASSUME_NONNULL_END
