//
//  NSDateFormatter+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (PPDBLHelper)


/**
 获取dateFormater实例

 @return dateFormatter实例
 */
+ (id)dateFormatter;


/**
 根据format获取formatter

 @param dateFormat format
 @return dateFormatter实例
 */
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;


/**
 默认dateFormatter实例，格式为：yyyy-MM-dd HH:mm:ss

 @return dateFormatter实例
 */
+ (id)defaultDateFormatter;


@end
