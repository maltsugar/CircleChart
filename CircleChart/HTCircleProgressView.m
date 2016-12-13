//
//  HTCircleProgressView.m
//  CircleChart
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "HTCircleProgressView.h"

@interface HTCircleProgressView ()

@property (nonatomic, strong) CAShapeLayer *progress1Layer;

@end


@implementation HTCircleProgressView

- (CAShapeLayer *)progress1Layer
{
    if (nil == _progress1Layer) {
        _progress1Layer = [[CAShapeLayer alloc]init];
        
    }
    return _progress1Layer;
}


- (void)createProgress1LayerWithColor:(UIColor *)color
{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.radius startAngle:self.startAngle endAngle:self.progressEndAngle clockwise:YES];
    self.progress1Layer.path = path.CGPath;
    self.progress1Layer.lineCap = kCALineCapRound;
    self.progress1Layer.fillColor = [UIColor clearColor].CGColor;
    self.progress1Layer.strokeColor = color.CGColor;
    self.progress1Layer.lineWidth = 14.0;
    
    [self.layer addSublayer:self.progress1Layer];
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(self.percentage1);
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    [self.progress1Layer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}


- (void)setPercentage1:(double)percentage1
{
    _percentage1 = percentage1;
    if (_percentage1 > 1) {
        _percentage1 = 1;
    }else if (_percentage1 < 0)
    {
        _percentage1 = 0;
    }
    
    [self createProgress1LayerWithColor:self.line1Color?:[UIColor purpleColor]];
    
}

@end
