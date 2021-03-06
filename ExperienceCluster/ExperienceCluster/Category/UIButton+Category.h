//
//  UIButton+Category.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)
+ (UIButton *)makeButtonWithName:(NSString *)name tag:(NSInteger)tag action:(SEL)action target:(id)target;
@end
