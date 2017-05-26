//
//  NSTimer+PPDBLHelper.m
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import "NSTimer+PPDBLHelper.h"

@implementation NSTimer (PPDBLHelper)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(void(^)())block
                                    repeats:(BOOL)repeats {
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)blockInvoke:(NSTimer *)timer {
    void (^block)() = timer.userInfo;
    if(block) {
        block();
    }
}

@end
