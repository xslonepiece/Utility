//
//  GradientButton.m
//  Utility
//
//  Created by xsl on 2017/5/17.
//  Copyright © 2017年 onepiece. All rights reserved.
//

#import "GradientButton.h"

@interface GradientButton ()
{
    NSArray <UIColor *> *_highlightedColors;
    NSArray <UIColor *> *_normalColors;
    NSArray <UIColor *> *_selectedColors;
    
    CGPoint _startPoint;
    CGPoint _endPoint;
}
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation GradientButton

- (CAGradientLayer *)gradientLayer{
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        [self.layer insertSublayer:self.gradientLayer atIndex:0];
        if (!_normalColors) {
            [self setGradientColors:@[[UIColor greenColor],[UIColor cyanColor]] forState:UIControlStateNormal];
            [self setStartDirection:GradientLeft endDirection:GradientRight];
        }
        [self setColors:_normalColors startPoint:_startPoint endPoint:_endPoint];
    }
    return _gradientLayer;
}

- (void)setGradientColors:(NSArray<UIColor *> *)colors forState:(UIControlState)state{
    switch (state) {
        case UIControlStateSelected:{
            _selectedColors = colors;
            break;
        }
        case UIControlStateHighlighted:{
            _highlightedColors = colors;
            break;
        }
        default:
            _normalColors = colors;
            break;
    }
}

- (void)setStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    _startPoint = startPoint;
    _endPoint = endPoint;
}

- (void)setStartDirection:(GradientDirection)startDirection endDirection:(GradientDirection)endDirection{
    CGPoint startPoint = [self locationOfDirection:startDirection];
    CGPoint endPoint = [self locationOfDirection:endDirection];
    [self setStartPoint:startPoint endPoint:endPoint];
}

- (void)setColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    NSMutableArray *cgcolors = [[NSMutableArray alloc] initWithCapacity:colors.count];
    [colors enumerateObjectsUsingBlock:^(UIColor *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [cgcolors addObject:(__bridge id)obj.CGColor];
    }];
    self.gradientLayer.colors = [cgcolors copy];
    self.gradientLayer.startPoint = startPoint;
    self.gradientLayer.endPoint = endPoint;
}

- (CGPoint)locationOfDirection:(GradientDirection)direction{
    CGPoint location = CGPointZero;
    switch (direction) {
        case GradientTop:{
            location = CGPointMake(0.5, 0);
            break;
        }
        case GradientLeft:{
            location = CGPointMake(0, 0.5);
            break;
        }
        case GradientRight:{
            location = CGPointMake(1, 0.5);
            break;
        }
        case GradientBottom:{
            location = CGPointMake(0.5, 1);
            break;
        }
        case GradientTopLeft:{
            location = CGPointMake(0, 0);
            break;
        }
        case GradientTopRight:{
            location = CGPointMake(1, 0);
            break;
        }
        case GradientBottomLeft:{
            location = CGPointMake(0, 1);
            break;
        }
        case GradientBottomRight:{
            location = CGPointMake(1, 1);
            break;
        }
        default:
            break;
    }
    return location;
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (highlighted) {
        if (_highlightedColors) {
            [self setColors:_highlightedColors startPoint:_startPoint endPoint:_endPoint];
        }
    }else if(self.selected){
        if (_selectedColors) {
            [self setColors:_selectedColors startPoint:_startPoint endPoint:_endPoint];
        }
    }else{
        [self setColors:_normalColors startPoint:_startPoint endPoint:_endPoint];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
}

@end
