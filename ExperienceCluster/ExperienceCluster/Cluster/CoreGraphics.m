//
//  CoreGraphics.m
//  ExperienceCluster
//
//  Created by Roy Miller on 16/12/14.
//  Copyright © 2016年 Roy Miller. All rights reserved.
//

#import "CoreGraphics.h"

@interface CoreGraphics () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *cells;
@property (nonatomic, strong) UITableView    *tableView;
@end

@implementation CoreGraphics
static NSString * const cellID = @"reusedCellID";

#pragma mark - LifeCycle & Init
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title      = @"CoreGraphics";
    self.cells     = @[].mutableCopy;
    
    [self cellList];
    
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}
- (void)cellList {
    [self addCell:@"CGPath"];
    [self addCell:@"CGColorSpace"];
    [self addCell:@"CGShadow"];
    [self addCell:@"CGGradient"];
    [self addCell:@"TransparencyLayers"];
    [self addCell:@"CGLayer"];
    [self addCell:@"CGPDFDocument"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%02ld - %@",indexPath.row+1,_cells[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = @"CGBase";
    Class class         = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title   = _cells[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Getters & Setters
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.contentInset    = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleSingleLine;
        _tableView.delegate        = self;
        _tableView.dataSource      = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        
    }
    return _tableView;
}

#pragma mark - Helper
- (void)addCell:(NSString *)cell{
    [self.cells addObject:cell];
}


@end
