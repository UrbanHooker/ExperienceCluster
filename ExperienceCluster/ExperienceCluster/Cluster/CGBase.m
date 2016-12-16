//
//  CGPath.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/14.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CGBase.h"

static const CGRect viewFrame = (CGRect){.origin = {20, 70}, .size = {375-40, 200}};

@interface CGBase ()

@end

@implementation CGBase

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Class viewClass = NSClassFromString(self.title);
    if (viewClass) {
        UIView *view = viewClass.new;
        view.frame = viewFrame;
        [self.view addSubview:view];
    }
}

@end
