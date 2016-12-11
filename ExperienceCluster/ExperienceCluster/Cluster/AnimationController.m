//
//  AnimationController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "AnimationController.h"
#import "UILabel+Category.h"

@implementation AnimationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *_label = [UILabel makeLabel];
    _label.center   = self.view.center;
    [self.view addSubview:_label];
    
    [UIView animateWithDuration:1.f
                          delay:0.f
         usingSpringWithDamping:.9f
          initialSpringVelocity:1.f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         _label.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.2, 2.2);
                         
                     } completion:^(BOOL finished) {
                         _label.transform = CGAffineTransformIdentity;
                     }];
}
@end
