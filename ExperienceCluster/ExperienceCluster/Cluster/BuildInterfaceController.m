//
//  BuildInterfaceController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "BuildInterfaceController.h"

@interface BuildInterfaceController ()
@property (nonatomic, strong) UILabel  *labelMadeByCode;
@property (nonatomic, strong) UIButton *btnPushToStoryboard;
@property (nonatomic, strong) UIButton *btnMadeByXib;
@end

@implementation BuildInterfaceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _labelMadeByCode = [UILabel new];
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:@"Hi there, I'm the label made by code, and the button below are the bodies you can click to test the result." attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    _labelMadeByCode.attributedText = attr;
    
    [self.view addSubview:_labelMadeByCode];
}

@end
