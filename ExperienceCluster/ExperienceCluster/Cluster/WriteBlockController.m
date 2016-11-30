//
//  WriteBlockController.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "WriteBlockController.h"
#import "ConvientDefine.h"

@implementation WriteBlockController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.typeDefineBlock = ^NSString*(NSString *dd) {
        return dd;
    };
    
    self.propertyBlock = ^NSString*(NSString *aa) {
        return aa;
    };
    
    // define here
    void (^innerBlock)() = ^void(){
        NSLog(@"2333");
    };
    // call
    innerBlock();
    
    [self callBlock:^NSString *(CGFloat howMuch) {
        FloatLog(howMuch);
        return @"";
    }];
}

- (void)callBlock:(NSString *(^)(CGFloat))callback {
    callback(4);
}

@end
