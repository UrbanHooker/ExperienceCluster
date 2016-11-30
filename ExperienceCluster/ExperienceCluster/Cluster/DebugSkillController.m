//
//  DebugSkillController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "DebugSkillController.h"
#import "ConvientDefine.h"

@interface DebugSkillController ()

@end

@implementation DebugSkillController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect    = (CGRect){.size = {100,200}};
    CGPoint point  = CGPointMake(100, 222);
    CGSize size    = CGSizeMake(30, 30);
    NSInteger intA = 4;
    CGFloat floatA = 3.333;
    BOOL boolA     = NO;
    
    RectLog(rect);
    PointLog(point);
    SizeLog(size);
    IntLog(intA);
    FloatLog(floatA);
    BOOLLog(boolA);
}

@end
