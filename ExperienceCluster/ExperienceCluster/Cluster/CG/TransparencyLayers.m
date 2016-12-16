//
//  TransparencyLayers.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/16.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "TransparencyLayers.h"

@implementation TransparencyLayers
- (void)drawRect:(CGRect)rect {
    
    CGContextRef myContext = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] setFill];
    CGContextFillRect(myContext, rect);
    
    CGFloat wd = rect.size.width;
    CGFloat ht = rect.size.height;
    
    CGSize myShadowOffset = CGSizeMake (10, -20);
    
    CGContextSetShadow (myContext, myShadowOffset, 10);
    CGContextBeginTransparencyLayer (myContext, NULL);

    CGContextSetRGBFillColor (myContext, 0, 1, 0, 1);
    CGContextFillRect (myContext, CGRectMake (wd/3+ 50,ht/2 ,wd/4,ht/4));
    CGContextSetRGBFillColor (myContext, 0, 0, 1, 1);
    CGContextFillRect (myContext, CGRectMake (wd/3-50,ht/2-100,wd/4,ht/4));
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);
    CGContextFillRect (myContext, CGRectMake (wd/3,ht/2-50,wd/4,ht/4));
    CGContextEndTransparencyLayer (myContext);
}
@end
