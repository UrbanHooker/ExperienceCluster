//
//  UILabel+Category.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

+ (UILabel *)makeLabel {
    UILabel *_labelMadeByCode       = [UILabel new];
    NSAttributedString *attr        = [[NSAttributedString alloc] initWithString:@"I'm Label." attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    _labelMadeByCode.attributedText = attr;
    _labelMadeByCode.numberOfLines  = 0;
    _labelMadeByCode.size           = CGSizeMake(200, 1000);
    [_labelMadeByCode sizeToFit];
    return _labelMadeByCode;
}


@end
