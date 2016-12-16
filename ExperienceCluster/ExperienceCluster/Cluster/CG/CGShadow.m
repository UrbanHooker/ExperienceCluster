//
//  CGShadow.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/16.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGShadow.h"

@implementation CGShadow
- (void)drawRect:(CGRect)rect {
    
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    CGFloat wd             = rect.size.width;
    CGFloat ht             = rect.size.height;
    
    CGSize  myShadowOffset  = CGSizeMake(15,  20);// 阴影在右下
    CGFloat myColorValues[] = {1, 0, 0, .6};
    CGColorRef myColor;
    CGColorSpaceRef myColorSpace;
    
    CGContextSaveGState(myContext);
    
    // Green rect
    CGContextSetShadow(myContext, myShadowOffset, 2);
    CGContextSetRGBFillColor(myContext, 0, 1, 0, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3 + 75, ht/2 , wd/4, ht/4));

    // Blue rect with red shadow
    myColorSpace = CGColorSpaceCreateDeviceRGB();
    myColor      = CGColorCreate(myColorSpace, myColorValues);
    CGContextSetShadowWithColor(myContext, myShadowOffset, 5, myColor);
    CGContextSetRGBFillColor(myContext, 0, 0, 1, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3-75,ht/2-100,wd/4,ht/4));
    
    CGColorRelease(myColor);
    CGColorSpaceRelease(myColorSpace);
    
    CGContextRestoreGState(myContext);
}
@end
