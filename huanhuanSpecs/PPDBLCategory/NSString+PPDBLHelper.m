//
//  NSString+PPDBLHelper.m
//  Pods
//
//  Created by wanyakun on 2017/3/27.
//
//

#import "NSString+PPDBLHelper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (PPDBLHelper)

- (NSString *)stringByTrans {
    NSMutableString *toTransStr = [NSMutableString stringWithString:self];
    
    if ([self rangeOfString:@"/"].length > 0) {
        [toTransStr replaceOccurrencesOfString:@"/"
                                     withString:@"!"
                                        options:NSLiteralSearch
                                          range: NSMakeRange(0, [toTransStr length])];
    } else {
        [toTransStr replaceOccurrencesOfString:@"!"
                                     withString:@"/"
                                        options:NSLiteralSearch
                                          range: NSMakeRange(0, [toTransStr length])];
    }
    
    NSString *result = [NSString stringWithString:toTransStr];
    return result;
}

- (NSString *)stringByReversed {
    NSUInteger i = 0;
    NSUInteger j = self.length - 1;
    unichar characters[self.length];
    while (i < j) {
        characters[j] = [self characterAtIndex:i];
        characters[i] = [self characterAtIndex:j];
        i ++;
        j --;
    }
    if(i == j)
    characters[i] = [self characterAtIndex:i];
    return [NSString stringWithCharacters:characters length:self.length];
}

- (NSString *)trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
}

- (CGFloat)heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width {
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

- (CGSize)boundingRectWithSize:(CGSize)size withTextFont:(UIFont *)font withLineSpacing:(CGFloat)lineSpacing {
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font}];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [self length])];

    CGSize textSize = [attributedStr boundingRectWithSize:size
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil].size;
    return textSize;
}

@end


@implementation NSString (Format)

- (NSString *)currencyFormateWithNumberOfDecimals:(int)decimals {
    if (self == nil || self.length == 0) {
        NSString *result = [NSString stringWithFormat:@"0"];
        if (decimals > 0) {
            result = [NSString stringWithFormat:@"0."];
            for (int i = 0; i < decimals; i++) {
                result = [result stringByAppendingString:@"0"];
            }
        }
        return result;
    } else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSString *zeroSymbol = [NSString stringWithFormat:@"0"];
        NSString *positiveFormat = [NSString stringWithFormat:@"#,###"];
        
        if (decimals > 0) {
            zeroSymbol = [NSString stringWithFormat:@"0."];
            if ([self intValue] == 0) {
                positiveFormat = [positiveFormat stringByAppendingString:@"0"];
            }
            positiveFormat = [positiveFormat stringByAppendingString:@"."];
            
            for (int i = 0; i < decimals; i++) {
                zeroSymbol = [zeroSymbol stringByAppendingString:@"0"];
                positiveFormat = [positiveFormat stringByAppendingString:@"0"];
            }
        }
        
        formatter.zeroSymbol = zeroSymbol;
        [formatter setPositiveFormat:positiveFormat];
        
        NSDecimalNumber *decNumberValue = [NSDecimalNumber decimalNumberWithString:self];
        return [formatter stringFromNumber:decNumberValue];
    }
}

- (NSString *)benifitFormate {
    return [NSString stringWithFormat:@"%.2f%%", [self floatValue]];
}

- (NSString *)mobileFormate {
    if ([self isMobilePhoneNumber]) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:self];
        [value insertString:@" " atIndex:3];
        [value insertString:@" " atIndex:8];
        return value;
    }
    
    return nil;
}

- (NSString*) secrectMobileFormate {
    NSMutableString *result = [NSMutableString stringWithString:self];
    NSRange range = NSMakeRange(3, 4);
    [result replaceCharactersInRange:range withString:@"****"];
    return result;
}

- (NSString*) secrectCardNoFormate {
    NSMutableString *result = [NSMutableString stringWithString:self];
    NSRange range = NSMakeRange(4, 8);
    if (result.length > 12) {
        [result replaceCharactersInRange:range withString:@" **** **** "];
    }
    return result;
}

@end

@implementation NSString (Security)

- (NSString *)stringFromMD5{
    
    if(self == nil || [self length] == 0)
    return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return [NSString stringWithString:outputString];
}

- (NSString *)urlEncode {
    NSString *encodedString = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

- (NSString *)urlDecode {
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)self,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

@end


@implementation NSString (Predicate)

- (BOOL)isInt {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)isDouble {
    NSScanner* scan = [NSScanner scannerWithString:self];
    double val;
    return[scan scanDouble:&val] && [scan isAtEnd];
}

- (BOOL)isNumber {
    if ([self isInt] == NO && [self isFloat] == NO && [self isDouble] == NO) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)isNumText {
    NSString *regex = @"^[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isLetter {
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isChineseCharacter {
    for(NSInteger i = 0; i < [self length];i++) {
        NSInteger a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isBankCardNumber {
    if ([self length] == 0) {
        return NO;
    }
    
    NSString* const regex = @"^(\\d{16}|\\d{19})$";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [predicate evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isMobilePhoneNumber {
    if ([self length] == 0) {
        return NO;
    }
    
    NSString *regex = @"^[1][34578]\\d{9}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isTelphoneNumber {
    if ([self length] == 0) {
        return NO;
    }
    
    NSString *regex = @"^\\d{3}-\\d{8}|\\d{4}-\\d{7}$";
    //匹配形式如 0511-4405222 或 021-87888822
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isIdCard {
    if ([self length] == 0) {
        return NO;
    }
    
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isZipCode {
    if ([self length] == 0) {
        return NO;
    }
    
    NSString *regex = @"^[1-9]\\d{5}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isEmail {
    NSString *regex = @"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}


@end

@implementation NSString (DisplayTime)

+(NSString *)compareCurrentTime:(NSTimeInterval) compareDate {
    NSDate *confromTimesp        = [NSDate dateWithTimeIntervalSince1970:compareDate/1000];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
#ifdef __IPHONE_8_0
    NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
#else
    NSCalendarUnit unitFlags = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
#endif
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    //    NSInteger referenceYear  =referenceComponents.year;
    //    NSInteger referenceMonth =referenceComponents.month;
    //    NSInteger referenceDay   =referenceComponents.day;
    NSInteger referenceHour  =referenceComponents.hour;
    //    NSInteger referemceMinute=referenceComponents.minute;
    
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    } else if((temp= timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    } else if((temp = timeInterval/3600) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    } else if ((temp = timeInterval/3600/24) == 1) {
        result = [NSString stringWithFormat:@"昨天%ld时",(long)referenceHour];
    } else if ((temp = timeInterval/3600/24) == 2) {
        result = [NSString stringWithFormat:@"前天%ld时",(long)referenceHour];
    } else if((temp = timeInterval/3600/24) < 31){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    } else if((temp = timeInterval/3600/24/30) < 12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    } else {
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

+ (NSString*)dateStringWithTimestamp:(NSTimeInterval)timestamp {
    NSDate *confromTimesp    = [NSDate dateWithTimeIntervalSince1970:timestamp/1000];
    NSCalendar *calendar     = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
#ifdef __IPHONE_8_0
    NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
#else
    NSCalendarUnit unitFlags = (NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit);
#endif
    NSDateComponents*referenceComponents=[calendar components:unitFlags fromDate:confromTimesp];
    NSInteger referenceYear  =referenceComponents.year;
    NSInteger referenceMonth =referenceComponents.month;
    NSInteger referenceDay   =referenceComponents.day;
    
    return [NSString stringWithFormat:@"%ld年%ld月%ld日",(long)referenceYear,(long)referenceMonth,(long)referenceDay];
}

+ (NSString*)stringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter {
    if ([NSString stringWithFormat:@"%@", @(timestamp)].length == 13) {
        timestamp /= 1000.0f;
    }
    NSDate*timestampDate=[NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    NSString *strDate = [dateFormatter stringFromDate:timestampDate];
    
    return strDate;
}

@end




