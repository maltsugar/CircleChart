//
//  CircleProgressView.m
//  CircleChart
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()

/** 圆形进度条的背景 */
@property (nonatomic, strong) CAShapeLayer *bgLayer;


@end

@implementation CircleProgressView
@synthesize progressLayer = _progressLayer, center = _center, radius = _radius;

- (CAShapeLayer *)bgLayer
{
    if (nil == _bgLayer) {
        _bgLayer = [[CAShapeLayer alloc]init];
        
    }
    return _bgLayer;
}

- (CAShapeLayer *)progressLayer
{
    if (nil == _progressLayer) {
        _progressLayer = [[CAShapeLayer alloc]init];
        
    }
    return _progressLayer;
}




- (instancetype)initWithFrame:(CGRect)frame startAngle:(double)sAngle endAngle:(double)eAngle
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 调整向左水平为0度
        self.startAngle = sAngle;
        self.endAngle = eAngle;

        _radius = MIN(CGRectGetWidth(frame)*0.5, CGRectGetHeight(frame)*0.5);
        _center = CGPointMake(CGRectGetWidth(frame)*0.5, CGRectGetHeight(frame)*0.5);

    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self createBackgroudLayer];
}


- (void)createBackgroudLayer
{
    UIColor *bgStrokeColor = self.backgroundLineColor?:[UIColor darkGrayColor];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:self.startAngle endAngle:self.endAngle clockwise:YES];
    self.bgLayer.path = path.CGPath;
    self.bgLayer.lineCap = kCALineCapRound;
    self.bgLayer.fillColor = [UIColor clearColor].CGColor;
    self.bgLayer.strokeColor = bgStrokeColor.CGColor;
    self.bgLayer.lineWidth = 14.0;
    
    
    [self.layer addSublayer:self.bgLayer];
    
}

- (void)createProgressLayerWithColor:(UIColor *)color
{
    // 计算终点的角度: 起始角度 + 角度差 * 百分比
    _progressEndAngle = self.startAngle + ((self.endAngle - self.startAngle) * self.percentage);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:_center radius:_radius startAngle:self.startAngle endAngle:_progressEndAngle clockwise:YES];
    self.progressLayer.path = path.CGPath;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = color.CGColor;
    self.progressLayer.lineWidth = 14.0;
    
    [self.layer addSublayer:self.progressLayer];
    
 
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.75;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1);
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    [self.progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
}


- (void)setPercentage:(double)percentage
{
    _percentage = percentage;
    if (_percentage > 1) {
        _percentage = 1;
    }else if (_percentage < 0)
    {
        _percentage = 0;
    }
    
    [self createProgressLayerWithColor:self.lineColor?:[UIColor orangeColor]];
}



- (void)setStartAngle:(double)startAngle
{
    _startAngle = DEGREES_TO_RADIANS(startAngle + 180);
    [self createBackgroudLayer];
}

- (void)setEndAngle:(double)endAngle
{
    _endAngle = DEGREES_TO_RADIANS(endAngle + 180);
    [self createBackgroudLayer];
}

@end
