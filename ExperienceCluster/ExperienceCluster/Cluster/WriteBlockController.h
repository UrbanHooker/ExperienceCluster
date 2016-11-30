//
//  WriteBlockController.h
//  ExperienceCluster
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "BaseViewController.h"


typedef NSString *(^TypeDefineBlock)(NSString *);

@interface WriteBlockController : BaseViewController

@property (nonatomic, copy) NSString *(^propertyBlock)(NSString *);
@property (nonatomic, copy) TypeDefineBlock typeDefineBlock;

@end
