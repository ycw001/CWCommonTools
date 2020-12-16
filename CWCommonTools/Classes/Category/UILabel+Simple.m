//
//  UILabel+Simple.m
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import "UILabel+Simple.h"
#import "UIColor+HexString.h"

#define HexColor(colorStr) [UIColor cm_colorWithHexString:colorStr]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation UILabel (Simple)

//背景色
- (UILabel *(^)(void))randomColor {
    return ^UILabel *(){
        self.backgroundColor = RandomColor;
        return self;
    };
}
- (UILabel *(^)(id _Nullable color))bgcolor {
    return ^UILabel *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            self.backgroundColor = HexColor(color);
        }else if ([color isKindOfClass:UIColor.class]) {
            self.backgroundColor = color;
        }
        return self;
    };
}

//圆角
- (UILabel *(^)(CGFloat radius))corner {
    return ^UILabel *(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UILabel *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner {
    return ^UILabel *(CGRect roundedRect, UIRectCorner corner, CGFloat radius){
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = roundedRect;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        return self;
    };
}
//边框
- (UILabel *(^)(id _Nullable color))borderColor {
    return ^UILabel *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        self.layer.borderColor = [color CGColor];
        return self;
    };
}
- (UILabel *(^)(CGFloat width))borderWidth {
    return ^UILabel *(CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}


//字体
- (UILabel *(^)(CGFloat fontSize))sysfont {
    return ^UILabel *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
- (UILabel *(^)(CGFloat fontSize))medium {
    return ^UILabel *(CGFloat fontSize){
        self.font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]?[UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]:[UIFont systemFontOfSize:fontSize];
        return self;
    };
}
- (UILabel *(^)(CGFloat fontSize))semibold {
    return ^UILabel *(CGFloat fontSize){
        self.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]?[UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]:[UIFont boldSystemFontOfSize:fontSize];
        return self;
    };
}
- (UILabel *(^)(CGFloat fontSize))bold {
    return ^UILabel *(CGFloat fontSize){
        self.font = [UIFont boldSystemFontOfSize:fontSize];
        return self;
    };
}

//字体颜色
- (UILabel *(^)(id _Nullable color))tcolor {
    return ^UILabel *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            self.textColor = HexColor(color);
        }else if ([color isKindOfClass:UIColor.class]) {
            self.textColor = color;
        }
        return self;
    };
}

//内容
- (UILabel *(^)(id _Nullable text))t {
    return ^UILabel *(id _Nullable text){
        NSString *content;
        if ([text isKindOfClass: NSString.class]) {
            content = text;
        }else if ([text isKindOfClass: NSNumber.class]) {
            content = [NSString stringWithFormat:@"%@",text];
        }else{
            content = [text description];
        }
        
        self.text = content;
        return self;
    };
}

- (UILabel *(^)(NSAttributedString * _Nullable text))attr {
    return ^UILabel *(NSAttributedString * _Nullable text){
        self.attributedText = text;
        return self;
    };
}

//文字位置
- (UILabel *)alignLeft {
    self.textAlignment = NSTextAlignmentLeft;
    return self;
}
- (UILabel *)alignCenter {
    self.textAlignment = NSTextAlignmentCenter;
    return self;
}
- (UILabel *)alignRight {
    self.textAlignment = NSTextAlignmentRight;
    return self;
}
//显示与隐藏
- (UILabel *)hide0 {
    self.hidden = NO;
    return self;
}

- (UILabel *)hide1 {
    self.hidden = YES;
    return self;
}
//多行
- (UILabel *(^)(int num))numLine {
    return ^UILabel *(int num){
        self.numberOfLines = num;
        return self;
    };
}

+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont text:(NSString *)text
{
    UILabel *commonLabel = [[UILabel alloc] init];
    if (textColor != nil) {
        commonLabel.textColor = textColor;
    }
    commonLabel.textAlignment = textAlignment;
    if (textFont) {
        commonLabel.font = textFont;
    }
    commonLabel.text = text;
    return commonLabel;
}

@end
