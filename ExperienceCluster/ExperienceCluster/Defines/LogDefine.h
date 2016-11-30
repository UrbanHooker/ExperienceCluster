//
//  LogDefine.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#ifndef LogDefine_h
#define LogDefine_h

#define RectLog(RECT) NSLog(@"%s: %@", #RECT,       NSStringFromCGRect(RECT));
#define PointLog(POINT) NSLog(@"%s: %@", #POINT,    NSStringFromCGPoint(POINT));
#define InsetsLog(INSETS) NSLog(@"%s: %@", #INSETS, NSStringFromUIEdgeInsets(INSETS));
#define SizeLog(SIZE) NSLog(@"%s: %@", #SIZE,       NSStringFromCGSize(SIZE));
#define VectorLog(VECTOR) NSLog(@"%s: %@", #VECTOR, NSStringFromCGVector(VECTOR));
#define RangeLog(RANGE) NSLog(@"%s: %@", #RANGE,    NSStringFromRange(RANGE));
#define FloatLog(FLOAT) NSLog(@"%s: %f", #FLOAT,    FLOAT);
#define IntLog(INT) NSLog(@"%s: %ld", #INT,         INT);
#define BOOLLog(BOOL) NSLog(@"%s: %@", #BOOL, BOOL == 0 ? @"NO":@"YES");

#endif /* LogDefine_h */
