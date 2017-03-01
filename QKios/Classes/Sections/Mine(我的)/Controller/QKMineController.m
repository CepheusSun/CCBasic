//
//  QKMineController.m
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKMineController.h"
#import "UIScrollView+HeaderImageScale.h"
#import "QKMineController+QKSkip.h"

@interface QKMineController ()<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *headerImageview;

@end

@implementation QKMineController

- (void)dealloc {
    if (self.tableView.sy_isInitial) {
        [self.tableView removeObserver:self.tableView forKeyPath:SYKeyPath(self.tableView, contentOffset)];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    {
        self.tableView.sy_headerImageHeight = RATIO_SIZE(190);
        self.headerImageview.alpha = 0;
        self.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
        self.tableView.sy_headerScaleImage = [UIImage imageNamed:@"persona_header_image"];
    }
    self.fd_prefersNavigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, RATIO_SIZE(190));
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"edit_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(editUserInformtion)];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - targets
- (void)editUserInformtion {
    [self skipToSetting];
}

#pragma mark - UITableViewdelegate & UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return RATIO_SIZE(44);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return RATIO_SIZE(18);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return RATIO_SIZE(18);
    }
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (indexPath.section == 0) {
        //检查登录状态
        
        switch (row) {
            case 0:// 我的直播
                
                break;
            case 1:// 我的收益
                
                break;
            case 2:// 我的账户
                
                break;
            case 3:// 超鱼账单
                
                break;
            case 4:// 贡献榜
                
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (row) {
            case 0: // 我的预约
                
                break;
            case 1:// 观看历史
                
                break;
            case 2:// 我的消息
                
                break;
            case 3:// 用户反馈
                
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {// 设置
        [self skipToSetting];
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView){
        CGFloat sectionHeaderHeight = RATIO_SIZE(18);
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}
@end
