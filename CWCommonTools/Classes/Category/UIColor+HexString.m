//
//  UIColor+HexString.m
//  CWCommonTools
//
//  Created by CW on 2020/12/14.
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)

+ (nonnull UIColor *)cm_colorWithHexString:(nonnull NSString *)aColorString {
    return [self cm_colorWithHexString:aColorString alpha:1.0f];
}

+ (nonnull UIColor *)cm_colorWithHexString:(nonnull NSString *)aColorString alpha:(CGFloat)aAlpha {
    if (aColorString.length == 0) {
        return nil;
    }
    
    if ([aColorString hasPrefix:@"#"]) {
        aColorString = [aColorString substringFromIndex:1];
    }
    
    if (aColorString.length == 6) {
        int len = (int)aColorString.length/3;
        unsigned int a[3];
        for (int i=0; i<3; i++) {
            NSRange range;
            range.location = i*len;
            range.length = len;
            NSString *str = [aColorString substringWithRange:range];
            [[NSScanner scannerWithString:str] scanHexInt:a+i];
            if (len == 1) {
                a[i] *= 17;
            }
        }
        return [self colorWithRed:a[0]/255.0f green:a[1]/255.0f blue:a[2]/255.0f alpha:aAlpha];
    }else if (aColorString.length == 8) {
        int len = (int)aColorString.length/4;
        unsigned int a[4];
        for (int i=0; i<4; i++) {
            NSRange range;
            range.location = i*len;
            range.length = len;
            NSString *str = [aColorString substringWithRange:range];
            [[NSScanner scannerWithString:str] scanHexInt:a+i];
            if (len == 1) {
                a[i] *= 17;
            }
        }
        return [self colorWithRed:a[0]/255.0f green:a[1]/255.0f blue:a[2]/255.0f alpha:a[3]/255.0f];
    }
    
    else if (aColorString.length <= 2) {
        unsigned int gray;
        [[NSScanner scannerWithString:aColorString] scanHexInt:&gray];
        if (aColorString.length == 1)
        {
            gray *= 17;
        }
        return [self colorWithWhite:gray/255.0f alpha:aAlpha];
    }
    return nil;
}

+ (nonnull NSString *)cm_hexValuesFromUIColor:(nonnull UIColor *)aColor {
    const CGFloat *rgba = CGColorGetComponents(aColor.CGColor);
    NSString *colorString =[NSString stringWithFormat:@"%02X%02X%02X%02X",(int)(rgba[0]*255),(int)(rgba[1]*255),(int)(rgba[2]*255),(int)(rgba[3]*255)];
    return colorString;
}

/// 适配黑暗模式动态颜色
/// @param lightColor 普通颜色 传nil默认白色
/// @param darkColor 黑暗模式颜色 传nil默认黑色
+ (UIColor *)cm_dynamicColorWithLight:(id)lightColor darkColor:(id)darkColor {
    UIColor *lColor;
    UIColor *dColor;
    if ([lightColor isKindOfClass:NSString.class]) {
        lColor = [UIColor cm_colorWithHexString:lightColor];
    }else if ([lightColor isKindOfClass:UIColor.class]) {
        lColor = lightColor;
    }else {
        lColor = [UIColor whiteColor];
    }
    if ([darkColor isKindOfClass:NSString.class]) {
        dColor = [UIColor cm_colorWithHexString:darkColor];
    }else if ([darkColor isKindOfClass:UIColor.class]) {
        dColor = darkColor;
    }else {
        dColor = [UIColor blackColor];
    }
    
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return dColor;
            } else {
                return lColor;
            }
        }];
    }else{
        return lColor;
    }
}

@end
