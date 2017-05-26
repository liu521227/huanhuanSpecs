//
//  NSArray+PPDBLHelper.m
//  Pods
//
//  Created by wanyakun on 2017/3/24.
//
//

#import "NSArray+PPDBLHelper.h"

@implementation NSArray (PPDBLHelper)

- (id)safeObjectAtIndex:(NSInteger)index {
    if (index >= self.count || index < 0) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range {
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    //超过了边界,就获取从loction开始所有的item
    if (location + length > self.count) {
        length = (self.count - location);
        return [self safeSubarrayWithRange:NSMakeRange(location, length)];
    } else {
        return [self subarrayWithRange:range];
    }
}

- (NSUInteger)safeIndexOfObject:(id)object {
    if (object == nil) {
        return NSNotFound;
    } else {
        return [self indexOfObject:object];
    }
}

+ (NSArray *)arrayNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

@end


@implementation NSMutableArray (PPDBLHelper)

- (void)safeAddObject:(id)object {
    if (object == nil) {
        return;
    } else {
        [self addObject:object];
    }
}

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index {
    if (object == nil || index > self.count) {
        return;
    } else {
        [self insertObject:object atIndex:index];
    }
}

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs {
    NSUInteger firstIndex = indexs.firstIndex;
    if (indexs == nil || objects == nil) {
        return;
    } else if (indexs.count != objects.count || firstIndex > objects.count) {
        return;
    } else {
        [self insertObjects:objects atIndexes:indexs];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (index >= self.count) {
        return;
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeRemoveObjectsInRange:(NSRange)range {
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        return;
    } else {
        [self removeObjectsInRange:range];
    }
}

@end
