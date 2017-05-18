//
//  UIColor+Extension.m
//  Utility
//
//  Created by xsl on 2017/5/17.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

/**
 *  根据普通状态color获取高亮状态的color
 *  @param color    普通状态的color
 *  @return 高亮状态的color
 */
+ (UIColor *)highlightColorWithColor:(UIColor *)color{
    return color.highlightColor;
}

/**
 *  根据普通状态color获取高亮状态的color
 */
- (UIColor *)highlightColor{
    CGFloat red = 0.0f;
    CGFloat green = 0.0f;
    CGFloat blue = 0.0f;
    CGFloat alpha = 0.0f;
    BOOL ok = [self getRed:&red green:&green blue:&blue alpha:&alpha];
    if (ok) {
        return [UIColor colorWithRed:red  green:green blue:blue alpha:alpha * 0.8];
    }
    return self;
}

@end
