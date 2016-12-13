//
//  HTCircleProgressView.h
//  CircleChart
//
//  Created by Mac on 16/5/27.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CircleProgressView.h"

@interface HTCircleProgressView : CircleProgressView


/** 第二个线条颜色 */
@property (nonatomic, strong) UIColor *line1Color;
/** 第二个线条百分比 0~1 */
@property (nonatomic, assign) double percentage1;
@end
