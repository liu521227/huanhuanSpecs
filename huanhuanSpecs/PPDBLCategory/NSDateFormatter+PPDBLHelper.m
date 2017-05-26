//
//  NSDateFormatter+PPDBLHelper.m
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import "NSDateFormatter+PPDBLHelper.h"

@implementation NSDateFormatter (PPDBLHelper)

+ (id)dateFormatter {
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
