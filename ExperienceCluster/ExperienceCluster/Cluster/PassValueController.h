//
//  PassValueController.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "BaseViewController.h"

@protocol PassValue <NSObject>
@optional
- (void)valueNeedToPass:(UILabel *)label;
@end

@interface AnotherController : BaseViewController <PassValue>
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, copy) void (^addLabel)(UILabel *);

@end

@interface PassValueController : BaseViewController
@property (nonatomic, weak) id<PassValue> delegate;
@end
