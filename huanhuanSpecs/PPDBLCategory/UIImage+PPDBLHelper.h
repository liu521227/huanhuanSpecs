//
//  UIImage+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (PPDBLHelper)

/**
 由颜色生成图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor*)color;

/**
 将图片剪裁至目标尺寸

 @param sourceImage 源图片
 @param targetSize 目标尺寸
 @return 目标图片
 */
+ (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage
                                          targetSize:(CGSize)targetSize;

/**
 图片旋转角度

 @param degrees 选择角度
 @return 图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 拉伸图片UIEdgeInsets

 @param insets UIEdgeInsets
 @return 图片
 */
- (UIImage *)resizableImage:(UIEdgeInsets)insets;

/**
 拉伸图片CGFloat

 @param scale 缩放比例
 @return 图片
 */
- (UIImage *)imageByResizeToScale:(CGFloat)scale;

/**
 放大图片CGSize

 @param size 尺寸
 @return 图片
 */
- (UIImage *)imageByResizeWithMaxSize:(CGSize)size;

/**
 小样图图片CGSize

 @param size 尺寸
 @return 图片
 */
- (UIImage *)imageWithThumbnailForSize:(CGSize)size;

/**
 通过Rect剪裁图片

 @param rect CGRect
 @return 图片
 */
- (UIImage *)imageByCropToRect:(CGRect)rect;

/**
 图片增加圆角

 @param radius 圆角半径
 @return 图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius;

/**
 图片增加圆角及边框

 @param radius 圆角半径
 @param borderWidth 边框宽度
 @param borderColor 边框颜色
 @return 图片
 */
- (UIImage *)imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

/**
 图片向左90度

 @return 图片
 */
- (UIImage *)imageByRotateLeft90;

/**
 图片向右90度

 @return 图片
 */
- (UIImage *)imageByRotateRight90;

/**
 图片转180度

 @return 图片
 */
- (UIImage *)imageByRotate180;

@end


@interface UIImage (Blur)
//玻璃化效果，这里与系统的玻璃化枚举效果一样，但只是一张图
- (UIImage *)imageByBlurSoft;

- (UIImage *)imageByBlurLight;

- (UIImage *)imageByBlurExtraLight;

- (UIImage *)imageByBlurDark;

- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;

- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

- (UIImage *)boxblurImageWithBlur:(CGFloat)blur
                    exclusionPath:(UIBezierPath *)exclusionPath;
@end





@interface UIImage (ImageEffects)

//图片效果
- (UIImage *)applyLightEffect;

- (UIImage *)applyExtraLightEffect;

- (UIImage *)applyDarkEffect;

- (UIImage *)applyBlurEffect;

- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;
@end
