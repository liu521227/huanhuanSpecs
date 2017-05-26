//
//  NSArray+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/24.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (PPDBLHelper)


/**
 获取index位置对象

 @param index Index
 */
- (id)safeObjectAtIndex:(NSInteger)index;

/**
 根据range获取subarray

 @param range 范围
 @return 子数组
 */
- (NSArray *)safeSubarrayWithRange:(NSRange)range;

/**
 根据对象获取数组中的索引位置

 @param object 对象
 @return 索引位置
 */
- (NSUInteger)safeIndexOfObject:(id)object;

/**
 通过Plist名取到Main Bundle中Plist文件中的数组

 @param name plist名称
 @return 数组
 */
+ (NSArray *)arrayNamed:(NSString *)name;

@end

/****************	Mutable Array		****************/

@interface NSMutableArray (PPDBLHelper)


/**
 向数组中添加对象

 @param object 对象
 */
- (void)safeAddObject:(id)object;


/**
 向数组中指定索引位置添加对象

 @param object 对象
 @param index 索引位置
 */
- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index;


/**
 向数组中指定索引位置添加对象

 @param objects 对象
 @param indexs 索引位置
 */
- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;


/**
 从数组中指定索引位置移除对象

 @param index 索引位置
 */
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;


/**
 从数组指定范围移除对象

 @param range 范围
 */
- (void)safeRemoveObjectsInRange:(NSRange)range;

@end

