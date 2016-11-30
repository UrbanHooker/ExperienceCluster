//
//  UIButton+Category.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)
+ (UIButton *)makeButtonWithName:(NSString *)name tag:(NSInteger)tag action:(SEL)action target:(id)target {
    UIButton *_btnfoo = [[UIButton alloc] initWithFrame:(CGRect){.size = CGSizeMake(100, 30)}];
    [_btnfoo setTitle:name forState:UIControlStateNormal];
    [_btnfoo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnfoo setTitle:@"Ahhhh~~~~" forState:UIControlStateHighlighted];
    [_btnfoo addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    _btnfoo.tag = tag;
    return _btnfoo;
}
@end
