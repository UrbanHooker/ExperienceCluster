//
//  CGPathView.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/14.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGPath.h"

//static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation CGPath

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(ctx, kCGBlendModeHue);
    /**
     如果你设置了RGBFillColor就等于你设置了油漆桶，FillSomething的时候会填充这个颜色
     如果（比如下面的）绘制的两个区域重叠，GPU会计算出最终绘制结果（是个紫色）
     */
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, rect.size.width/1.5f, rect.size.height));
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 0.5);
    CGContextFillRect(ctx, CGRectMake(0, 0, rect.size.width/1.5f, rect.size.height));
    
    /**
     CGMutablePathRef就是UIBezirePath的底层
     用法：先MoveToPoint再AddLineToPoint，最后ClosePath，把path加到ctx上
     设置ctx各种笔的颜色，线的属性，然后DrawPath
     */
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 200,150);
    CGPathAddLineToPoint(path, nil, 300,100);
    CGPathAddLineToPoint(path, nil, 10, 40);
    CGContextAddPath(ctx, path);
    
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);//< 设置颜色空间
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextSetLineWidth(ctx,6);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineJoin(ctx, kCGLineJoinMiter);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    /**
     画曲线：AddCurveToPoint，再StrokePath
     */
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddCurveToPoint(ctx, 100, 100, 150, 150, 20, 200);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    CGContextStrokePath(ctx);
    
    /**
     如果原来设置了笔颜色，这里需要修改颜色，在FillSomething
     */
    path = CGPathCreateMutable();
    CGPathAddRect(path, nil, CGRectMake(140, 100, 100, 70));
    CGContextAddPath(ctx, path);
    
    CGContextSetRGBFillColor(ctx, .2, .5, .7, .5);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    CFRelease(path);
    
    CGContextFillRect(ctx, CGRectMake(120, 50, 100, 100));
    
    /**
     画线段
     */
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    const CGPoint points[] = {CGPointMake(10, 20),CGPointMake(100, 20),CGPointMake(100, 20),CGPointMake(20, 50)};
    CGContextStrokeLineSegments(ctx, points, 4);
    
    /**
     带样式的高级图案线段
     */
    CGFloat patterns2[] = {5,1,4,1,3,1,2,1,1,1,1,2,1,3,1,4,1,5};
    CGContextSetLineDash(ctx, 0, patterns2, 18);
    const CGPoint points4[] = {CGPointMake(40, 85),CGPointMake(280, 85)};
    CGContextStrokeLineSegments(ctx, points4, 2);
    
//    CGContextRotateCTM (ctx, -radians(15.));
}

@end
