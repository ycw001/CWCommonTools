//
//  UIView+Simple.m
//  CWCommonTools
//
//  Created by CW on 2020/12/11.
//

#import "UIView+Simple.h"
#import "UIColor+HexString.h"

#define HexColor(colorStr) [UIColor cm_colorWithHexString:colorStr]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation UIView (Simple)

//初始化
+ (instancetype)view {
    return [[self alloc]init];
}

//背景色
- (UIView *(^)(void))randomColor {
    return ^UIView *(){
        self.backgroundColor = RandomColor;
        return self;
    };
}
- (UIView *(^)(id _Nullable color))bgcolor {
    return ^UIView *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            self.backgroundColor = HexColor(color);
        }else if ([color isKindOfClass:UIColor.class]) {
            self.backgroundColor = color;
        }
        return self;
    };
}

//圆角
- (UIView *(^)(CGFloat radius))corner {
    return ^UIView *(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UIView *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner {
    return ^UIView *(CGRect roundedRect, UIRectCorner corner, CGFloat radius){
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = roundedRect;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        return self;
    };
}
//边框
- (UIView *(^)(id _Nullable color))borderColor {
    return ^UIView *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        self.layer.borderColor = [color CGColor];
        return self;
    };
}
- (UIView *(^)(CGFloat width))borderWidth {
    return ^UIView *(CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}
//显示与隐藏
- (UIView *)hide0 {
    self.hidden = NO;
    return self;
}

- (UIView *)hide1 {
    self.hidden = YES;
    return self;
}

@end
