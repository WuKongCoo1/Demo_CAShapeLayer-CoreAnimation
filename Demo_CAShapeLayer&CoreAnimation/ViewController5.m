//
//  ViewController5.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@property (weak, nonatomic)  UIButton *startButton;
- (IBAction)startAction:(UIButton *)sender;

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"一个复杂一点的登录动画");
    [self.shapeLayer removeFromSuperlayer];
    
    UIButton *startButton = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor = [UIColor purpleColor];
        [btn setTitle:@"start" forState:UIControlStateNormal];
        btn.frame = (CGRect){{0, 0}, {200, 50}};
        btn.center = self.view.center;
        
        [btn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    
    [self.view addSubview:startButton];
    
    self.startButton = startButton;
    
    
}

- (IBAction)startAction:(UIButton *)sender {
    [self addMaskAnimation];
}

- (void)addMaskAnimation
{
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.frame = self.startButton.bounds;
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    shapeLayer.opacity = .3f;
    shapeLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(self.startButton.bounds.size.width / 2, 0, 1, self.startButton.bounds.size.height)].CGPath;//不初始化则无动画效果
    
    [self.startButton.layer addSublayer:shapeLayer];
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = 0.5f;
    animation.toValue = (__bridge id)[UIBezierPath bezierPathWithRect:self.startButton.bounds].CGPath;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [shapeLayer addAnimation:animation forKey:@"shapeAnimation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addPackupAnimation];
    });
}

- (void)addPackupAnimation
{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.startButton.bounds;
    self.startButton.layer.mask = maskLayer;
    
    //path动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 0.3f;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.toValue = (__bridge id)[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.startButton.bounds.size.width / 2, self.startButton.bounds.size.height / 2) radius:1 startAngle:0 endAngle:M_PI * 2 clockwise:YES].CGPath;
    pathAnimation.fromValue = (__bridge id)[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.startButton.bounds.size.width / 2, self.startButton.bounds.size.height / 2) radius:self.startButton.bounds.size.width / 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES].CGPath;
    pathAnimation.fillMode = kCAFillModeForwards;
    
    //透明度动画
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = 0.3f;
    opacityAnimation.toValue = @(1);
    opacityAnimation.fromValue = @(0);
    opacityAnimation.removedOnCompletion = YES;
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[pathAnimation];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = pathAnimation.duration;
    
    [maskLayer addAnimation:group forKey:@"packupAnimation"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.startButton.hidden = YES;
        [self addLoadingAnimation];
        
    });
}

- (void)addLoadingAnimation
{
    CAShapeLayer *shapeLayer =  ({
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.position = self.view.center;
        layer.bounds = CGRectMake(0, 0, 50, 50);
        layer.backgroundColor = [UIColor clearColor].CGColor;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.lineWidth = 5.f;
        UIBezierPath *storkePath = [UIBezierPath bezierPathWithOvalInRect:layer.bounds];
        layer.path = storkePath.CGPath;
        layer.strokeStart = 0;
        layer.strokeEnd = 0.1;
        
        layer;
    });
    
    [self.view.layer addSublayer:shapeLayer];
    
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
    
    [shapeLayer addAnimation:animationGroup forKey:@"indicatorAnimation"];
}
@end
