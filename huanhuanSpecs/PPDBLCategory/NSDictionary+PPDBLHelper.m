//
//  NSDictionary+PPDBLHelper.m
//  Pods
//
//  Created by wanyakun on 2017/3/24.
//
//

#import "NSDictionary+PPDBLHelper.h"

@implementation NSDictionary (PPDBLHelper)

- (id)safeObjectForKey:(NSString *)key {
    if (key == nil || [self isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    id object = [self objectForKey:key];
    if (object == nil || object == [NSNull null]) {
        return @"";
    }
    
    return object;
}

- (id)safeKeyForValue:(id)value {
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    __block id key = @"";
    [self.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([value isEqual:[self safeObjectForKey:obj]]) {
            key = obj;
            *stop = YES;
        }
    }];
    return key;
}

@end

@implementation NSMutableDictionary (PPDBLHelper)

- (void)safeSetObject:(id)object forKey:(id)key {
    if (key == nil || [key isKindOfClass:[NSNull class]]) {
        return;
    }
    
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return;
    }
    
    [self setValue:object forKey:key];
}

@end
