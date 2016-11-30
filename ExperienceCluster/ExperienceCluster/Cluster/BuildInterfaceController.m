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
    _labelMadeByCode.numberOfLines = 0;
    _labelMadeByCode.size = CGSizeMake(200, 1000);
    [_labelMadeByCode sizeToFit];
    _labelMadeByCode.center = self.view.center;
    _labelMadeByCode.centerY -= 100;
    [self.view addSubview:_labelMadeByCode];
    
    _btnPushToStoryboard = [[UIButton alloc] initWithFrame:(CGRect){.size = CGSizeMake(100, 50)}];
    _btnPushToStoryboard.centerX = _labelMadeByCode.centerX;
    _btnPushToStoryboard.top = _labelMadeByCode.bottom+50;
    [_btnPushToStoryboard setTitle:@"Push ME!" forState:UIControlStateNormal];
    [_btnPushToStoryboard addTarget:self action:@selector(pushToStoryboard:) forControlEvents:UIControlEventTouchUpInside];
    _btnPushToStoryboard.tag = 0;
    [self.view addSubview:_btnPushToStoryboard];

    
    _btnMadeByXib = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:nil options:nil] lastObject];
    _btnMadeByXib.size = CGSizeMake(200, 50);
    _btnMadeByXib.backgroundColor = [UIColor brownColor];
    _btnMadeByXib.centerX = _btnPushToStoryboard.centerX;
    _btnMadeByXib.top = _btnPushToStoryboard.bottom+50;
    [_btnMadeByXib addTarget:self action:@selector(pushToStoryboard:) forControlEvents:UIControlEventTouchUpInside];
    _btnMadeByXib.tag = 1;
    [self.view addSubview:_btnMadeByXib];

}

- (void)pushToStoryboard:(UIButton *)button {
    if (button.tag == 0) {
        
    }
    else if (button.tag == 1) {
        NSLog(@"Hi, i'm xib");
    }
}


@end
