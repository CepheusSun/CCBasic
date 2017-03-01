//
//  QKSettingController.m
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKSettingController.h"

@interface QKSettingController ()

@end

@implementation QKSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
}

#pragma mark - UITableViewdelegate & UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RATIO_SIZE(44);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return RATIO_SIZE(18);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (IBAction)logoutButtonClicked:(id)sender {
    
}

@end
