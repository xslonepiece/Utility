//
//  NSNumber+Operate.m
//  kdweibo
//
//  Created by xsl on 2017/4/24.
//  Copyright © 2017年 www.kingdee.com. All rights reserved.
//

#import "NSNumber+Operate.h"

@implementation NSNumber (Operate)

/** 金额千分制 */
- (NSString *)amountValue{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    // 保留两位小数
    formatter.roundingMode = kCFNumberFormatterRoundFloor;// 值变小
    formatter.maximumFractionDigits = 2;
    NSString *amountString = [formatter stringFromNumber:@(self.doubleValue + 0.005)];
    NSRange range = [amountString rangeOfString:@"."];
    if (range.location == NSNotFound) {// 没有小数
        return [NSString stringWithFormat:@"%@.00",amountString];
    }else if(range.location == amountString.length - 2){// 只有一位小数
        return [NSString stringWithFormat:@"%@0",amountString];
    }// 两位以上小数找后台😄
    return amountString;
}

/** 数量千分制 */
- (NSString *)quantityValue{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return [formatter stringFromNumber:self];
}

- (NSString *)wanValue{
    double doubleValue = self.doubleValue;
    if ([self overWan]) {
        doubleValue /= 10000;
    }
    return [@(doubleValue) amountValue];
}

- (NSString *)rateValue{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    // 保留两位小数
    formatter.maximumFractionDigits = 2;
    formatter.roundingMode = kCFNumberFormatterRoundFloor;// 值变小
    double rateValue = self.doubleValue * 100.f;
    return [formatter stringFromNumber:@(rateValue + 0.005)];
}

- (BOOL)overWan{
    return self.doubleValue > 10000.00;
}

- (BOOL)overHundred{
    return self.doubleValue > 100.00 || self.doubleValue < -100.00;
}

- (BOOL)isNegative{
    return self.doubleValue < 0.0f;
}

- (BOOL)overZero{
    return self.doubleValue > 0.0f;
}

//- (BOOL)isZero{
//    
//}

@end
