//
//  UIView+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SCREEN_WITHOUT_STATUS_HEIGHT ([UIScreen mainScreen].bounds.size.height - [[UIApplication sharedApplication] statusBarFrame].size.height)

@interface UIView (PPDBLHelper)

// coordinator getters
- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)x;
- (CGFloat)y;
- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)centerX;
- (CGFloat)centerY;
- (CGFloat)bottom;
- (CGFloat)right;

- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;

// height
- (void)setHeight:(CGFloat)height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setWidth:(CGFloat)width;
- (void)widthEqualToView:(UIView *)view;

// center
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;

// size
- (void)setSize:(CGSize)size;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (void)fillWidth;
- (void)fillHeight;
- (void)fill;

- (UIView *)topSuperView;

@end

/****************	LayoutProtocol		****************/

@protocol LayoutProtocol

@required
- (void)calculateLayout;

@end

/****************	MotionEffect		****************/

@interface UIView (MotionEffect)

/**
 UIMotionEffect和Home页背景视差效果

 @param offset offset
 */
- (void)addCenterMotionEffectsXYWithOffset:(CGFloat)offset;

@end

/****************	Window		****************/

@interface UIView (Window)


/**
 把View加在Window上
 */
- (void)addToWindow;

@end

/****************	Screenshot		****************/

@interface UIView (Screenshot)


/**
 View截图

 @return UIImage
 */
- (UIImage*)screenshot;


/**
 ScrollView截图

 @param contentOffset contentOffset
 @return UIImage
 */
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;


/**
 View按Rect截图

 @param frame Rect
 @return UIImage
 */
- (UIImage*) screenshotInFrame:(CGRect)frame;

@end

/****************	Screenshot		****************/

@interface UIView (Animation)<CAAnimationDelegate>

@property(nonatomic,copy)void(^completeBlock)();


/**
 抖动动画
 */
- (void) shakeAnimation;


/**
 弹簧动画
 */
- (void) springingAnimation;


/**
 旋转180度
 */
- (void) trans180DegreeAnimation;


/**
 抛物线动画

 @param start 开始位置
 @param end 结束位置
 @param height 高度
 @param duration 事件
 @param completedBlock 结束Block
 */
- (void) throwFrom:(CGPoint)start to:(CGPoint)end height:(CGFloat)height
          duration:(CGFloat)duration completedBlock:(void(^)())completedBlock;

- (void) praiseAnimation;

/**
 view旋转180°

 @param duration 动画时间
 */
- (void)rotate180WithDuration:(NSTimeInterval)duration;


/**
 view翻转180°

 @param duration 动画时间
 */
- (void)flip180WithDuration:(NSTimeInterval)duration;


/**
 view顺时针翻转180°

 @param duration 动画时间
 */
- (void)clockwiseFlip180WithDuration:(NSTimeInterval)duration;


/**
 抖动效果

 @param duration 动画时间
 */
- (void)shakeWithdDuration:(NSTimeInterval)duration;

@end
