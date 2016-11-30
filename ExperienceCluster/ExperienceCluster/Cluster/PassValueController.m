//
//  PassValueController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "PassValueController.h"
#import "UILabel+Category.h"
#import "UIButton+Category.h"

static NSString * const passValueNotification = @"passValue";

@interface PassValueController ()

@end

@implementation PassValueController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // make button
    UIButton *buttonPassVariable = [UIButton makeButtonWithName:@"variable" tag:0 action:@selector(passValue:) target:self];
    UIButton *buttonBlock        = [UIButton makeButtonWithName:@"block" tag:1 action:@selector(passValue:) target:self];
    UIButton *buttonDelegate     = [UIButton makeButtonWithName:@"delegate" tag:2 action:@selector(passValue:) target:self];
    UIButton *buttonNotification = [UIButton makeButtonWithName:@"notification" tag:3 action:@selector(passValue:) target:self];
    
    // button position
    buttonBlock.center         = self.view.center;
    buttonBlock.centerY        -= 60;
    buttonPassVariable.center  = buttonBlock.center;
    buttonPassVariable.centerY -= 60;
    buttonDelegate.center      = buttonBlock.center;
    buttonDelegate.centerY     += 60;
    buttonNotification.center  = buttonDelegate.center;
    buttonNotification.centerY += 60;
    
    // add button to view
    [self.view addSubview:buttonPassVariable];
    [self.view addSubview:buttonBlock];
    [self.view addSubview:buttonDelegate];
    [self.view addSubview:buttonNotification];
    
}

- (void)passValue:(UIButton *)btn {
    
    // This label is the value we pass to another controller
    UILabel *_label = [UILabel makeLabel];
    
    AnotherController *anotherController = [AnotherController new];
    
    switch (btn.tag) {
        case 0: {
            
            anotherController.label = _label;
            [self.navigationController pushViewController:anotherController animated:YES];
            
        } break;
        case 1: {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (anotherController.addLabel) {
                    anotherController.addLabel(_label);
                }
            });
            
            [self.navigationController pushViewController:anotherController animated:YES];
            
        } break;
        case 2: {
            
            self.delegate = anotherController;
            if ([self.delegate respondsToSelector:@selector(valueNeedToPass:)]) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.delegate valueNeedToPass:_label];
                });
            }
            [self.navigationController pushViewController:anotherController animated:YES];
            
        } break;
        case 3: {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSDictionary *dic = [NSDictionary dictionaryWithObject:_label forKey:@"label"];
                [[NSNotificationCenter defaultCenter] postNotificationName:passValueNotification object:nil userInfo:dic];
            });
            [self.navigationController pushViewController:anotherController animated:YES];
            
        } break;
        default:
            break;
    }
}


@end


@interface AnotherController ()

@end

@implementation AnotherController

- (instancetype)init {
    self = [super init];
    if (!self) return self;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf         = self;
    self.addLabel                        = ^void(UILabel *label) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.view addSubview:label];
        label.center = strongSelf.view.center;
    };
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passValueByNotification:) name:passValueNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - PassValue Methods
- (void)setLabel:(UILabel *)label {
    [self.view addSubview:label];
    label.center = self.view.center;
}
- (void)valueNeedToPass:(UILabel *)label {
    [self.view addSubview:label];
    label.center = self.view.center;
}
- (void)passValueByNotification:(NSNotification *)noti {
    NSDictionary *userInfo = noti.userInfo;
    UILabel *label = [userInfo objectForKey:@"label"];
    if (label) {
        [self.view addSubview:label];
        label.center = self.view.center;
    }
}

@end
