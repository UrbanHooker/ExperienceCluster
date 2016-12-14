//
//  UIImage+RYCategory.m
//  Fanzhou
//
//  Created by Roy Miller on 16/9/6.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "UIImage+RYCategory.h"

@implementation UIImage (RYCategory)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 4.0f, 4.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
