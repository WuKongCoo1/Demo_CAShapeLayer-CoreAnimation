//
//  ViewController4.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"把CAShapeLayer设置为蒙版来做动画");
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.mask = shapeLayer;
    
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 0)];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 200)];
    shapeLayer.path = fromPath.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (id)fromPath.CGPath;
    animation.toValue = (id)toPath.CGPath;
    animation.duration = 5.f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [shapeLayer addAnimation:animation forKey:@"animation"];
}

@end
