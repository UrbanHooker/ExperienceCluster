//
//  CGColorSpace.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/16.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGColorSpace.h"

@implementation CGColorSpace

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //// 第一种写法
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);//< 设置颜色空间
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);//< 设置颜色空间，https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_color/dq_color.html Table 4-2  Color-setting functions
    
    //// 第二种写法
    [[UIColor brownColor] setFill];
    [[UIColor orangeColor] setStroke];
    
    //// 第三种写法
    CGContextStrokeRectWithWidth(ctx, rect, 3);
    CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
    
    CGContextFillRect(ctx, rect);
}

@end
