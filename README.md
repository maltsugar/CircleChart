# CircleChart

# 圆圈形的图表(自用)
模仿仪表盘的形式，左边水平方向为0度， 顺时针转，右边水平方向为180度，可以自定义开始结束角度，比如-45  --  225。
![demo](http://ww4.sinaimg.cn/mw690/72aba7efgw1f49s02okwoj20af0j5gls.jpg)
<code><pre>

-(void)viewDidLoad {
    [super viewDidLoad];
    
    CircleProgressView *progressView = [[CircleProgressView alloc]initWithFrame:CGRectMake(0, 200, 202, 180) startAngle:-45.0 endAngle:225.0];
    progressView.backgroundLineColor = [UIColor orangeColor];
    progressView.lineColor = [UIColor redColor];
    
    [self.view addSubview:progressView];
    _pView = progressView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static double percent = 0.25;
    _pView.percentage = percent;
    percent += 0.25;
}
</pre></code>
