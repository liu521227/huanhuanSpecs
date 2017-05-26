//
//  NSDictionary+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/24.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PPDBLHelper)

/**
 用于数据解析，数组和字典不要用此方法

 @param key Key
 @return 字符串或值类型
 */
- (id)safeObjectForKey:(NSString *)key;

/**
 通过value解析Key

 @param value value
 @return Key
 */
- (id)safeKeyForValue:(id)value;

@end

/****************	Mutable Dictionary	****************/

@interface NSMutableDictionary (PPDBLHelper)

/**
 设置键值对 针对对象为空处理
 
 @param object 对象
 @param key Key
 */
- (void)safeSetObject:(id)object forKey:(id)key;

@end
