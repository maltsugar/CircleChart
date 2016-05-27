//
//  ViewController.m
//  CircleChart
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "HTCircleProgressView.h"

#define COLOR(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface ViewController ()
{
    HTCircleProgressView *_pView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR(31, 39, 48, 1.0);
    
    HTCircleProgressView *progressView = [[HTCircleProgressView alloc]initWithFrame:CGRectMake(0, 0, 202, 180) startAngle:-50.0 endAngle:230.0];
    progressView.center = self.view.center;
    
    
    progressView.backgroundLineColor = COLOR(119, 118, 119, 1.0);
    progressView.lineColor = COLOR(253, 201, 79, 1.0);
    progressView.line1Color = COLOR(235, 93, 19, 1.0);
    
    [self.view addSubview:progressView];
    _pView = progressView;


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _pView.percentage = 0.61;
        
        _pView.percentage1 = 0.53;
    });
}


@end
