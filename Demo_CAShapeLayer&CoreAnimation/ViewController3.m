//
//  ViewController3.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"利用CAShapeLayer做一个旋转loading动画");
    self.shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth = 5.f;
    UIBezierPath *storkePath = [UIBezierPath bezierPathWithOvalInRect:self.shapeLayer.bounds];
    self.shapeLayer.path = storkePath.CGPath;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0.1;

    //旋转动画
    CABasicAnimation *rotateAnimaiton = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimaiton.duration = 1.f;
    rotateAnimaiton.repeatCount = CGFLOAT_MAX;
    rotateAnimaiton.removedOnCompletion = NO;
    rotateAnimaiton.fillMode = kCAFillModeForwards;
    rotateAnimaiton.toValue = @(M_PI * 2);
    
    //stroke动画
    CABasicAnimation *storkeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    storkeAnimation.duration = 2.f;
    storkeAnimation.repeatCount = CGFLOAT_MAX;
    storkeAnimation.fillMode =  kCAFillModeForwards;
    storkeAnimation.removedOnCompletion = NO;
    storkeAnimation.toValue = @(1);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 2.f;
    animationGroup.repeatCount =CGFLOAT_MAX;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.animations = @[rotateAnimaiton, storkeAnimation];
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    [self.shapeLayer addAnimation:animationGroup forKey:@"indicatorAnimation"];
}

@end
