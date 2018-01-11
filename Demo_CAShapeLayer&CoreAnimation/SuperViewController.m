//
//  SuperViewController.m
//  Demo_CAShapeLayer&CoreAnimation
//
//  Created by 吴珂 on 2018/1/11.
//  Copyright © 2018年 世纪阳天. All rights reserved.

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = NSStringFromClass(self.class);
    
    NSLog(@"==========%@===========", NSStringFromClass(self.class));
   self.shapeLayer = ({
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.bounds = CGRectMake(0, 0, 200, 200);
        shapeLayer.position = self.view.center;
        shapeLayer.backgroundColor = [UIColor cyanColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.lineWidth = 3.f;
        shapeLayer;
   });
    
    [self.view.layer addSublayer:self.shapeLayer];
}


@end
