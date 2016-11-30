//
//  RootViewController.m
//
//  Created by Roy Miller on 16/11/30.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation RootViewController

static NSString * const cellID = @"reusedCellID";

#pragma mark - LifeCycle & Init
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title      = @"Experience Cluster";
    self.titles     = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self cellList];
    
    [self.tableView reloadData];
}
- (void)cellList {
    [self addCell:@"BuildInterface" class:@"BuildInterfaceController"];
    [self addCell:@"PassValue" class:@"PassValueController"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%03ld - %@",indexPath.row+1,_titles[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class         = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title             = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Helper
- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

@end
