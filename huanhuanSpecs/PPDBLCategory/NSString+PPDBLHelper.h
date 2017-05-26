//
//  NSString+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (PPDBLHelper)

/**
 *  字符串转化，！转为/, /转为！
 *
 *  @return 转换结果
 */
- (NSString *)stringByTrans;

/**
 *  字符串反转
 *
 *  @return 反转后的结果
 */
- (NSString *)stringByReversed;

/**
 去掉前后空格
 
 @return 去掉前后空格后的字符串
 */
- (NSString *)trimmedString;

/**
 计算文字高度

 @param fontSize 字体大小
 @param width 宽度
 @return 文字高度
 */
- (CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width;


/**
 计算文本size大小

 @param size size
 @param font 字体
 @param lineSpacing 行间距
 @return 文本size
 */
-(CGSize)boundingRectWithSize:(CGSize)size withTextFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing;

@end

/****************	Format		****************/

@interface NSString (Format)

/**
 将字符串进行货币格式化

 @param decimals 保留小数位数
 @return 货币格式化字符串
 */
- (NSString *)currencyFormateWithNumberOfDecimals:(int)decimals;

/**
 保留两位小数格式化收益率

 @return 两位小数格式的收益率
 */
- (NSString *)benifitFormate;

/**
 转为电话格式

 @return 电话格式
 */
- (NSString*) mobileFormate;

/**
 电话号码中间4位****显示
 
 @return 隐藏后的字符串
 */
- (NSString*) secrectMobileFormate;

/**
 银行卡号中间8位显示
 
 @return 隐藏后的字符串
 */
- (NSString*) secrectCardNoFormate;


@end

/****************	Security		****************/

@interface NSString (Security)

/**
 MD5加密

 @return MD5加密结果
 */
- (NSString *)stringFromMD5;

/**
 URLEcoding编码

 @return 编码结果
 */
- (NSString*)urlEncode;

/**
 URLDecode解码

 @return 解码结果
 */
- (NSString *)urlDecode;

@end

/****************	Predicate		****************/

@interface NSString (Predicate)

/**
 判断是否为Int字符串
 
 @return 是否为Int字符串
 */
- (BOOL)isInt;

/**
 判断是否为Float字符串
 
 @return 是否为Float字符串
 */
- (BOOL)isFloat;

/**
 判断是否为Double字符串
 
 @return 判断是否为Double字符串
 */
- (BOOL)isDouble;

/**
 判断字符串是否为数字
 
 @return 是否为数字
 */
- (BOOL)isNumber;

/**
 判断字符串是否为数字字符串
 
 @return 是否为数字字符串
 */
- (BOOL)isNumText;

/**
 *  是否为字母
 *
 *  @return 是否为字母
 */
- (BOOL)isLetter;

/**
 *  是否为汉字
 *
 *  @return 是否为汉字
 */
- (BOOL)isChineseCharacter;

/**
 判断是否为银行卡号

 @return 是否银行卡号
 */
- (BOOL) isBankCardNumber;

/**
 判断字符串是否为手机
 
 @return 是否为手机
 */
- (BOOL)isMobilePhoneNumber;

/**
 判断是否为座机号码
 
 @return 是否为座机
 */
- (BOOL)isTelphoneNumber;

/**
 判断字符串是否为身份证
 
 @return 是否为身份证
 */
- (BOOL)isIdCard;

/**
 判断字符串是否为邮政编码
 
 @return 是否为邮政编码
 */
- (BOOL)isZipCode;

/**
 判断字符串是否为邮箱
 
 @return 是否为邮箱字符串
 */
- (BOOL)isEmail;

@end

/****************	DisplayTime		****************/

@interface NSString (DisplayTime)


/**
 通过时间戳计算时间差（几小时前、几天前）

 @param compareDate 时间戳
 @return 时间差
 */
+ (NSString *)compareCurrentTime:(NSTimeInterval) compareDate;


/**
 通过时间戳得出显示时间（xxxx年xx月xx日）

 @param timestamp 时间戳
 @return 年月日
 */
+ (NSString *)dateStringWithTimestamp:(NSTimeInterval)timestamp;


/**
 过时间戳和格式显示时间

 @param timestamp 时间戳
 @param formatter 格式
 @return 日期时间字符串
 */
+ (NSString *)stringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;




@end


