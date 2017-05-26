//
//  UIColor+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (PPDBLHelper)


/**
 根据HEX和alpha生成颜色

 @param hex HEX
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;

/**
 十六进制字符串转颜色

 @param hexString 16进制字符串
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;


/**
 根据HEX生成颜色

 @param hexValue HEX
 @return 颜色
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue;


/**
 根据颜色和明亮度转化为HSB颜色

 @param color 颜色
 @param delta 明亮度
 @return HSB颜色
 */
+ (UIColor*)colorRGBConvertToHSB:(UIColor*)color withBrightnessDelta:(CGFloat)delta;


/**
 根据颜色和透明度转化为HSB颜色

 @param color 颜色
 @param delta 透明度
 @return HSB颜色
 */
+ (UIColor*)colorRGBConvertToHSB:(UIColor*)color withAlphaDelta:(CGFloat)delta;

@end
