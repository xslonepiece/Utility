//
//  NSNumber+Operate.h
//  kdweibo
//
//  Created by onepiece on 2017/4/24.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Operate)

/**
 *  金额千分制（带两位小数）-->0.00
 */
- (NSString *)amountValue;

/** 
 *  数量千分制
 */
- (NSString *)quantityValue;

/** 
 *  单位:万 (千分制)(金额) -->0.00
 */
- (NSString *)wanValue;

/**
 *  百分比数
 */
- (NSString *)rateValue;

/**
 *  大于10000
 */
- (BOOL)overWan;

/**
 *  是否为负数
 */
- (BOOL)isNegative;

/**
 *  是否大于0
 */
- (BOOL)overZero;

/**
 *  是否等于0
 */
- (BOOL)isZero;

@end

