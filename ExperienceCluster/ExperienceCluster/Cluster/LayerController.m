//
//  LayerController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/11.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "LayerController.h"
#import "UIImage+RYCategory.h"

@interface LayerController ()

@property (nonatomic, strong) CAShapeLayer      *shapeLayer;
@property (nonatomic, strong) CAGradientLayer   *gradientLayer;
@property (nonatomic, strong) CAEmitterLayer    *emitterLayer;
@property (nonatomic, strong) CAReplicatorLayer *replicatorLayer;
@property (nonatomic, strong) CATextLayer       *textLayer;

@end

@implementation LayerController

#pragma mark - LifeCycle & Init
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.layer addSublayer:self.shapeLayer];
    [self.view.layer addSublayer:self.gradientLayer];
    [self.view.layer addSublayer:self.emitterLayer];
    [self.view.layer addSublayer:self.replicatorLayer];
}

#pragma mark - Getters & Setters
- (CAShapeLayer *)shapeLayer {
    if(_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer layer];
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(100, 130)];
        [path addLineToPoint:CGPointMake(100, 160)];
        [path addLineToPoint:CGPointMake(300, 160)];
        [path closePath];
        
        _shapeLayer.path        = path.CGPath;
        _shapeLayer.fillColor   = [UIColor colorWithRed:.3 green:.4 blue:.3 alpha:.9].CGColor;
        _shapeLayer.bounds      = self.view.bounds;
        _shapeLayer.anchorPoint = CGPointMake(0, 0);
    }
    return _shapeLayer;
}

- (CAGradientLayer *)gradientLayer {
    if(_gradientLayer == nil) {
        _gradientLayer = [CAGradientLayer layer];
        
        _gradientLayer.colors = @[(id)[[UIColor colorWithRed:.2 green:.1 blue:.5 alpha:1.f] CGColor],
                                  (id)[[UIColor colorWithRed:.2 green:.1 blue:.5 alpha:.7f] CGColor],
                                  (id)[[UIColor colorWithRed:.2 green:.1 blue:.5 alpha:.4f] CGColor],
                                  (id)[[UIColor colorWithRed:.2 green:.1 blue:.5 alpha:.2f]CGColor],
                                  (id)[[UIColor colorWithRed:.2 green:.1 blue:.5 alpha:.1f]CGColor],
                                  (id)[[UIColor clearColor] CGColor]];
        
        _gradientLayer.startPoint = CGPointMake(0.5, 0);
        _gradientLayer.endPoint   = CGPointMake(0.5, 1);
        
        _gradientLayer.bounds      = self.view.bounds;
        _gradientLayer.anchorPoint = CGPointMake(0, 0);
    }
    return _gradientLayer;
}

- (CAEmitterLayer *)emitterLayer {
    if(_emitterLayer == nil) {
        _emitterLayer = [CAEmitterLayer layer];
        
        _emitterLayer.birthRate       = .3f;
        _emitterLayer.lifetime        = 1.2f;
        _emitterLayer.emitterShape    = kCAEmitterLayerCircle;
        _emitterLayer.emitterPosition = CGPointMake(100, 400);
        _emitterLayer.emitterSize     = CGSizeMake(5, 5);
        
        _emitterLayer.bounds      = self.view.bounds;
        _emitterLayer.anchorPoint = CGPointMake(0, 0);
        
        CAEmitterCell *cell = [[CAEmitterCell alloc] init];
        cell.contents       = (__bridge id)[UIImage imageWithColor:[UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0]].CGImage;
        cell.birthRate      = 150;
        cell.lifetime       = 5.0;
        cell.alphaSpeed     = -0.4;
        cell.velocity       = 50;
        cell.velocityRange  = 50;
        cell.emissionRange  = M_PI * 2.0;
        
        _emitterLayer.emitterCells = @[cell];
    }
    return _emitterLayer;
}

- (CAReplicatorLayer *)replicatorLayer {
    if(_replicatorLayer == nil) {
        _replicatorLayer = [CAReplicatorLayer layer];
        
        _replicatorLayer.bounds   = CGRectMake(0, 0, 100, 100);
        _replicatorLayer.position = self.view.center;
        
        CALayer *dot        = [CALayer layer];
        dot.bounds          = CGRectMake(0, 0, 25, 25);
        dot.position        = CGPointMake(30, 30);
        dot.backgroundColor = [UIColor colorWithRed:.5 green:.2 blue:.6 alpha:1].CGColor;
        dot.borderWidth     = .5;
        dot.cornerRadius    = 2.0;
        
        NSTimeInterval duration  = 1.5;
        CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        shrink.fromValue         = @(1.0);
        shrink.toValue           = @(0.1);
        shrink.duration          = duration;
        shrink.repeatCount       = CGFLOAT_MAX;
        [dot addAnimation:shrink forKey:@"dd"];
        
        NSInteger count = 15;
        CGFloat angle   = (CGFloat)2*M_PI / (CGFloat)count;
        
        _replicatorLayer.instanceCount       = count;
        _replicatorLayer.instanceTransform   = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
        _replicatorLayer.instanceDelay       = duration/(CGFloat)count;
        _replicatorLayer.instanceRedOffset   = -0.13;
        _replicatorLayer.instanceAlphaOffset = -0.03;
        
        [_replicatorLayer addSublayer:dot];
        
    }
    return _replicatorLayer;
}

- (CATextLayer *)textLayer {
	if(_textLayer == nil) {
		_textLayer = [CATextLayer layer];
        
        _textLayer.frame = CGRectMake(500, 200, 200, 200);
        
        _textLayer.string = @"Hello buddy";
        
	}
	return _textLayer;
}

@end
