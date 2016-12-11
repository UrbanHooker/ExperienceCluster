//
//  ProtocalWithProperty.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/11.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "BaseViewController.h"

@protocol SomeManager <NSObject>

@optional

@property NSString *greeting;

- (void)sayHello;

@end

@interface ProtocalWithProperty : BaseViewController

@property (nonatomic, weak) id<SomeManager> manager;

@end
