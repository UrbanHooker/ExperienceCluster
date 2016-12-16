//
//  CGGradient.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/16.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGGradient.h"

static inline double radians(double degrees) {return degrees * M_PI/180;}

static void myCalculateShadingValues(void *info,
                                     const CGFloat *in,
                                     CGFloat *out) {
    CGFloat v;
    size_t k, components;
    static const CGFloat c[] = {1, 0, .5, 0 };
    
    components =(size_t)info;
    
    v      = *in;
    for(k  = 0; k < components -1; k++)
        *out++ = c[k] * v;
    *out++ = 1;

//    double frequency[4] = { 55, 220, 110, 0 };
//    components = (size_t)info;
//    for (k = 0; k < components - 1; k++)
//        *out++ = (1 + sin(*in * frequency[k]))/2;
//    *out++ = 1; // alpha
}

static CGFunctionRef myGetFunction(CGColorSpaceRef colorspace) {
    size_t numComponents;
    static const CGFloat input_value_range[2]   = { 0, 1 };
    static const CGFloat output_value_ranges[8] = { 0, 1, 0, .5,
        0, 1, 0, 1 };
    static const CGFunctionCallbacks callbacks  = { 0, &myCalculateShadingValues, NULL };
    
    numComponents = 1 + CGColorSpaceGetNumberOfComponents(colorspace);
    return CGFunctionCreate((void *) numComponents,
                            1,
                            input_value_range,
                            numComponents,
                            output_value_ranges,
                            &callbacks);
}

@implementation CGGradient
-(void)drawRect:(CGRect)rect {
    
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    [self drawCGGradient:myContext rect:rect];
    
    [self drawCGShading:myContext rect:rect];
    
}

-(void)drawCGGradient:(CGContextRef)myContext rect:(CGRect)rect{
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations  = 2;
    CGFloat locations[2]  = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 0.5, 0.4, 1.0,//< Start color
        0.8, 0.8, 0.3, 1.0 }; //< End color
    
    myColorspace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
    myGradient   = CGGradientCreateWithColorComponents(myColorspace, components,
                                                       locations, num_locations);
    
    /**
     或者这样写清晰
     UIColor *lightGradientColor =[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
     UIColor *darkGradientColor  =[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
     
     CFArrayRef colors =(__bridge CFArrayRef)[NSArray arrayWithObjects:(id)lightGradientColor.CGColor,(id)darkGradientColor.CGColor, nil];
     
     CGColorSpaceRef colorSpc = CGColorSpaceCreateDeviceRGB();
     CGGradientRef gradient   = CGGradientCreateWithColors(colorSpc, colors, locations);
     */
    
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = 0;
    myStartPoint.y = 0.0;
    myEndPoint.x   = rect.origin.x+rect.size.width;
    myEndPoint.y   = rect.origin.y+rect.size.height;
    
    /**
     线性
     */
    CGContextDrawLinearGradient(myContext, myGradient, myStartPoint, myEndPoint, 0);
    
    /**
     轴向
     */
    CGFloat myStartRadius, myEndRadius;
    myStartRadius = 30;
    myEndRadius   = 90;
    CGContextDrawRadialGradient(myContext, myGradient, myStartPoint,
                                myStartRadius, myEndPoint, myEndRadius,
                                kCGGradientDrawsAfterEndLocation);
    
    CGColorSpaceRelease(myColorspace);
    CGGradientRelease(myGradient);
}

-(void)drawCGShading:(CGContextRef)myContext rect:(CGRect)rect {
    CGPoint startPoint, endPoint;
    CGAffineTransform myTransform;
    
    CGFloat width  = rect.size.width;
    CGFloat height = rect.size.height;
    
    startPoint = CGPointMake(0,0.5);
    endPoint   = CGPointMake(1,0.5);
    
    CGColorSpaceRef colorspace      = CGColorSpaceCreateDeviceRGB();
    CGFunctionRef myShadingFunction = myGetFunction(colorspace);
    
    CGShadingRef shading = CGShadingCreateAxial(colorspace,
                                                startPoint, endPoint,
                                                myShadingFunction,
                                                false, false);
    
    myTransform = CGAffineTransformMakeScale(width, height);
    CGContextConcatCTM(myContext, myTransform);
    CGContextSaveGState(myContext);
    
    CGContextClipToRect(myContext, CGRectMake(0, 0, 1, 1));
    CGContextSetRGBFillColor(myContext, 1, 1, 1, 1);
    CGContextFillRect(myContext, CGRectMake(0, 0, 1, 1));
    
    CGContextBeginPath(myContext);
    CGContextAddArc(myContext, .5, .5, .3, 0, radians(180), 0);
    CGContextClosePath(myContext);
    CGContextClip(myContext);
    
    CGContextDrawShading(myContext, shading);
    CGColorSpaceRelease(colorspace);
    CGShadingRelease(shading);
    CGFunctionRelease(myShadingFunction);
    
    CGContextRestoreGState(myContext);
    
}

@end
