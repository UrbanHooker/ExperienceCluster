//
//  ProtocalWithProperty.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/11.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "ProtocalWithProperty.h"

@interface ProtocalWithProperty () <SomeManager>

@end

@implementation ProtocalWithProperty

@synthesize greeting = _greeting;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = self;
    
    if ([self respondsToSelector:@selector(sayHello)]) {
        [self sayHello];
    }
}

- (void)sayHello {
    
    self.greeting = @"Hello buddy";
    
    NSLog(@"%@", self.greeting);
}

@end
