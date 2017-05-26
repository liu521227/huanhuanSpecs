//
//  NSTimer+PPDBLHelper.h
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import <Foundation/Foundation.h>

@interface NSTimer (PPDBLHelper)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(void(^)())block
                                    repeats:(BOOL)repeats;

@end
