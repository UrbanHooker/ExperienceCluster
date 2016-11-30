//
//  ReferenceCountController.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "BaseViewController.h"

@protocol DelegateDemo <NSObject>
@optional
- (void)demo;
@end


@interface ReferenceCountController : BaseViewController

// This two below is the same
@property BaseViewController *controllerA;
@property (atomic, strong, readwrite) BaseViewController *controllerB;

// This two below is the same
@property CGFloat floatA;
@property (atomic, assign, readwrite) CGFloat floatB;

// copy
@property (copy) NSString *stringA;
@property (copy) void (^blockA)();

// assign
@property (assign) int       intA;
@property (assign) NSInteger intB;
@property (assign) CGSize    sizeA;
@property (assign) CGRect    rectA;

// weak
@property (weak) id<DelegateDemo> delegate;

// getter
@property (getter=isReal) BOOL real;

@end
