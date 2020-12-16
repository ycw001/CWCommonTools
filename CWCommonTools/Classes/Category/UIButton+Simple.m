//
//  UIButton+Simple.m
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import "UIButton+Simple.h"
#import "UIColor+HexString.h"
#import "UIButton+WebCache.h"
#import <objc/runtime.h>

#define HexColor(colorStr) [UIColor cm_colorWithHexString:colorStr]
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@implementation UIButton (Simple)

static char topNameKey;

static char rightNameKey;

static char bottomNameKey;

static char leftNameKey;
//初始化
+ (instancetype)button {
    return [self buttonWithType:UIButtonTypeCustom];
}
//背景色
- (UIButton *(^)(void))randomColor {
    return ^UIButton *(){
        self.backgroundColor = RandomColor;
        return self;
    };
}
- (UIButton *(^)(id _Nullable color))bgcolor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            self.backgroundColor = HexColor(color);
        }else if ([color isKindOfClass:UIColor.class]) {
            self.backgroundColor = color;
        }
        return self;
    };
}
//圆角
- (UIButton *(^)(CGFloat radius))corner {
    return ^UIButton *(CGFloat radius){
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UIButton *(^)(CGRect roundedRect, UIRectCorner corner, CGFloat radius))layerCorner {
    return ^UIButton *(CGRect roundedRect, UIRectCorner corner, CGFloat radius){
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = roundedRect;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        return self;
    };
}
//边框
- (UIButton *(^)(id _Nullable color))borderColor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        self.layer.borderColor = [color CGColor];
        return self;
    };
}
- (UIButton *(^)(CGFloat width))borderWidth {
    return ^UIButton *(CGFloat width){
        self.layer.borderWidth = width;
        return self;
    };
}
//显示与隐藏
- (UIButton *)hide0 {
    self.hidden = NO;
    return self;
}
- (UIButton *)hide1 {
    self.hidden = YES;
    return self;
}
//设置图片
- (UIButton *(^)(id _Nullable image))normalImg {
    return ^UIButton *(id _Nullable image){
        if ([image isKindOfClass:NSString.class]) {
            image = [UIImage imageNamed:image];
        }
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(id _Nullable image))highlightedImg {
    return ^UIButton *(id _Nullable image){
        if ([image isKindOfClass:NSString.class]) {
            image = [UIImage imageNamed:image];
        }
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(id _Nullable image))disabledImg {
    return ^UIButton *(id _Nullable image){
        if ([image isKindOfClass:NSString.class]) {
            image = [UIImage imageNamed:image];
        }
        [self setImage:image forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(id _Nullable image))selectedImg {
    return ^UIButton *(id _Nullable image){
        if ([image isKindOfClass:NSString.class]) {
            image = [UIImage imageNamed:image];
        }
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
}
//字体
- (UIButton *(^)(CGFloat fontSize))sysfont {
    return ^UIButton *(CGFloat fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
- (UIButton *(^)(CGFloat fontSize))medium {
    return ^UIButton *(CGFloat fontSize){
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]?[UIFont fontWithName:@"PingFangSC-Medium" size:fontSize]:[UIFont systemFontOfSize:fontSize];
        return self;
    };
}
- (UIButton *(^)(CGFloat fontSize))semibold {
    return ^UIButton *(CGFloat fontSize){
        self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]?[UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize]:[UIFont boldSystemFontOfSize:fontSize];
        return self;
    };
}
//字体颜色
- (UIButton *(^)(id _Nullable color))normalColor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(id _Nullable color))highlightedColor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        [self setTitleColor:color forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(id _Nullable color))disabledColor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        [self setTitleColor:color forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(id _Nullable color))selectedColor {
    return ^UIButton *(id _Nullable color){
        if ([color isKindOfClass:NSString.class]) {
            color = HexColor(color);
        }
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
}
//设置文字
- (UIButton *(^)(NSString * _Nullable text))normalText {
    return ^UIButton *(NSString * _Nullable text){
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString * _Nullable text))highlightedText {
    return ^UIButton *(NSString * _Nullable text){
        [self setTitle:text forState:UIControlStateHighlighted];
        return self;
    };
}
- (UIButton *(^)(NSString * _Nullable text))disabledText {
    return ^UIButton *(NSString * _Nullable text){
        [self setTitle:text forState:UIControlStateDisabled];
        return self;
    };
}
- (UIButton *(^)(NSString * _Nullable text))selectedText {
    return ^UIButton *(NSString * _Nullable text){
        [self setTitle:text forState:UIControlStateSelected];
        return self;
    };
}
//事件
- (UIButton *(^)(id target,SEL selector))action {
    return ^UIButton *(id target,SEL selector){
        [self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        return self;
    };
}

+ (UIButton  *)creatNormalButton:(UIColor *)titleColor contentAlig:(UIControlContentHorizontalAlignment)contentAlig font:(UIFont *)titleFont title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (titleColor != nil) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    btn.contentHorizontalAlignment = contentAlig;
    if (title != nil) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (titleFont != nil) {
        btn.titleLabel.font = titleFont;
    }
    return btn;
}

- (void)btn_setImagePosition:(ImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imgW = self.imageView.image.size.width;
    CGFloat imgH = self.imageView.image.size.height;
    CGSize origLabSize = self.titleLabel.bounds.size;
    CGFloat orgLabW = origLabSize.width;
    CGFloat orgLabH = origLabSize.height;
    
    CGSize trueSize = [self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat trueLabW = trueSize.width;
    
    //image中心移动的x距离
    CGFloat imageOffsetX = orgLabW/2 ;
    //image中心移动的y距离
    CGFloat imageOffsetY = orgLabH/2 + spacing/2;
    //label左边缘移动的x距离
    CGFloat labelOffsetX1 = imgW/2 - orgLabW/2 + trueLabW/2;
    //label右边缘移动的x距离
    CGFloat labelOffsetX2 = imgW/2 + orgLabW/2 - trueLabW/2;
    //label中心移动的y距离
    CGFloat labelOffsetY = imgH/2 + spacing/2;
    
    switch (postion) {
        case ImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case ImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, orgLabW + spacing/2, 0, -(orgLabW + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imgW + spacing/2), 0, imgW + spacing/2);
            break;
            
        case ImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX1, -labelOffsetY, labelOffsetX2);
            break;
            
        case ImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX1, labelOffsetY, labelOffsetX2);
            break;
            
        default:
            break;
    }
    
}

- (void)setEnlargeEdge:(CGFloat) size {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left {
    
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (CGRect)enlargedRect {
   
   NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
   
   NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
   
   NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
   
   NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
   
   if (topEdge && rightEdge && bottomEdge && leftEdge){
       
       return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                         
                         self.bounds.origin.y - topEdge.floatValue,
                         
                         self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                         
                         self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
       
   }
   else{
       return self.bounds;
   }
}

- (UIView*)hitTest:(CGPoint) point withEvent:(UIEvent*) event {
   
   CGRect rect = [self enlargedRect];
   
   if (CGRectEqualToRect(rect, self.bounds))
       
   {
       return [super hitTest:point withEvent:event];
   }
   return CGRectContainsPoint(rect, point) ? self : nil;
}

@end
