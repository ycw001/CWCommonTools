//
//  UIImageView+Simple.m
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import "UIImageView+Simple.h"
#import "UIColor+HexString.h"
#import "UIImageView+WebCache.h"

#define HexColor(colorStr) [UIColor cm_colorWithHexString:colorStr]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation UIImageView (Simple)

//背景色
- (UIImageView *(^)(void))randomColor {
    return ^UIImageView *(){
        self.backgroundColor = RandomColor;
        return self;
    };
}
- (UIImageView *(^)(id _Nullable color))bgcolor {
    return ^UIImageView *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            self.backgroundColor = HexColor(color);
        }else if ([color isKindOfClass:UIColor.class]) {
            self.backgroundColor = color;
        }
        return self;
    };
}

//圆角
- (UIImageView *(^)(CGFloat radius))corner {
    return ^UIImageView *(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UIImageView *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner {
    return ^UIImageView *(CGRect roundedRect, UIRectCorner corner, CGFloat radius){
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = roundedRect;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        return self;
    };
}
//边框
- (UIImageView *(^)(id _Nullable color))borderColor {
    return ^UIImageView *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        self.layer.borderColor = [color CGColor];
        return self;
    };
}
- (UIImageView *(^)(CGFloat width))borderWidth {
    return ^UIImageView *(CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}


//内容填充方式
- (UIImageView *)aspectFit {
    self.contentMode = UIViewContentModeScaleAspectFit;
    return self;
}

- (UIImageView *)aspectFill {
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    return self;
}

- (UIImageView *)centerMode {
    self.contentMode = UIViewContentModeCenter;
    return self;
}
//设置图片
- (UIImageView *(^)(NSString *url,id _Nullable placeholderImage))url {
    return ^UIImageView *(NSString *url,__nullable id placeholderImage){
        if ([placeholderImage isKindOfClass:NSString.class]) {
            placeholderImage = [UIImage imageNamed:placeholderImage];
        }
        [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
        return self;
    };
}

- (UIImageView *(^)(id _Nullable image))img {
    return ^UIImageView *(id _Nullable image){
        if ([image isKindOfClass:NSString.class]) {
            image = [UIImage imageNamed:image];
        }
        self.image = image;
        return self;
    };
}

//显示与隐藏
- (UIImageView *)hide0 {
    self.hidden = NO;
    return self;
}

- (UIImageView *)hide1 {
    self.hidden = YES;
    return self;
}

@end
