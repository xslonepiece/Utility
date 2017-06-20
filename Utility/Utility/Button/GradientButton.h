//
//  GradientButton.h
//  Utility
//
//  Created by xsl on 2017/5/17.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    GradientTop,
    GradientLeft,
    GradientBottom,
    GradientRight,
    GradientTopLeft,
    GradientTopRight,
    GradientBottomLeft,
    GradientBottomRight
}GradientDirection;

@interface GradientButton : UIButton



/**
 *  设置渐变颜色变化数组
 *  @param colors   渐变颜色数组
 *  @param state    按钮状态
 */

/**
 <#Description#>

 @param colors <#colors description#>
 @param state <#state description#>
 */
- (void)setGradientColors:(NSArray <UIColor *> *)colors forState:(UIControlState)state;

/**
 *  设置渐变起止位置，默认左右渐变
 *  @param startPoint   渐变开始位置
 *  @param endPoint     渐变结束位置
 */
- (void)setStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 *  设置渐变起止位置，默认左右渐变
 *  @param startDirection   渐变开始位置
 *  @param endDirection     渐变结束位置
 */
- (void)setStartDirection:(GradientDirection)startDirection endDirection:(GradientDirection)endDirection;

@end
