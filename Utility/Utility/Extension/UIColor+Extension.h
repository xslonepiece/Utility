//
//  UIColor+Extension.h
//  Utility
//
//  Created by xsl on 2017/5/17.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  根据普通状态color获取高亮状态的color
 *  @param color    普通状态的color
 *  @return 高亮状态的color
 */
+ (UIColor *)highlightColorWithColor:(UIColor *)color;

/**
 *  根据普通状态color获取高亮状态的color
 */
- (UIColor *)highlightColor;

@end
