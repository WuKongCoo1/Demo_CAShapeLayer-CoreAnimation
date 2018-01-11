//
//  ViewController2.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CAShapeLayer与贝塞尔曲线");
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //二次贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.shapeLayer.bounds.size.height / 2)];
    [path addCurveToPoint:CGPointMake(self.shapeLayer.bounds.size.width, 100) controlPoint1:CGPointMake(50, 0) controlPoint2:CGPointMake(150, 200)];
    self.shapeLayer.path = path.CGPath;
    
    //绘制动画
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @0.5;
    strokeEndAnimation.toValue = @1;
    strokeEndAnimation.duration = 5.f;
    
    [self.shapeLayer addAnimation:strokeEndAnimation forKey:@"strokeAnimation"];
    
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @0.5;
    strokeStartAnimation.toValue = @0;
    strokeStartAnimation.duration = 5.f;
    
    [self.shapeLayer addAnimation:strokeStartAnimation forKey:@"strokeStartAnimation"];
}

@end
