//
//  ReferenceCountController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "ReferenceCountController.h"
#import "UILabel+Category.h"

@interface ReferenceCountController ()

@end

@implementation ReferenceCountController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *_label = [UILabel makeLabelWithContent:@"Please see the .h file"];
    _label.center = self.view.center;
    [self.view addSubview:_label];
}

@end
