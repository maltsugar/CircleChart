//
//  ViewController.m
//  CircleChart
//
//  Created by Mac on 16/5/25.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()
{
    CircleProgressView *_pView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CircleProgressView *progressView = [[CircleProgressView alloc]initWithFrame:CGRectMake(0, 200, 202, 180) startAngle:-45.0 endAngle:225.0];
    progressView.backgroundLineColor = [UIColor orangeColor];
    progressView.lineColor = [UIColor redColor];
    
    [self.view addSubview:progressView];
    _pView = progressView;


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static double percent = 0.25;

    _pView.percentage = percent;
    
    
    percent += 0.25;
}

@end
