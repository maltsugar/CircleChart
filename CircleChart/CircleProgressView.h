//
//  CircleProgressView.h
//  CircleChart
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface CircleProgressView : UIView

/**
 *  初始化方法, 模仿仪表盘的形式，默认左边水平时为0度， 顺时针方向为正方向，默认就是正方向画线条
 *
 *  @param frame
 *  @param sAngle 开始的角度（角度值即可）
 *  @param eAngle 结束的角度（角度值即可）
 *
 *  @return 返回实例
 */
- (instancetype)initWithFrame:(CGRect)frame startAngle:(double)sAngle endAngle:(double)eAngle;

/** 线条背景颜色 */
@property (nonatomic, strong) UIColor *backgroundLineColor;

/** 线条颜色 */
@property (nonatomic, strong) UIColor *lineColor;

/** 开始的角度（角度制） */
@property (nonatomic, assign) double startAngle;

/** 结束的角度（角度制） */
@property (nonatomic, assign) double endAngle;

/** 百分比 0~1 */
@property (nonatomic, assign) double percentage;



- (void)createProgressLayerWithColor:(UIColor *)color;

@end
