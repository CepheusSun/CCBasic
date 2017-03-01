//
//  QKMineController+QKSkip.h
//  QKios
//
//  Created by sunny on 2017/3/1.
//  Copyright © 2017年 CepheusSun. All rights reserved.
//

#import "QKMineController.h"

//我的界面跳转相关代码
@interface QKMineController (QKSkip)

// 我的直播列表
- (void)skipToMyBroadCast;

// 我的收益列表
- (void)skipToMyIncome;

// 我的账户列表
- (void)skipToAccount;

// 超鱼账单
- (void)skipToMyBill;

// 贡献榜
- (void)skipToContribute;

// 我的预约
- (void)skipToYuyue;

// 观看历史
- (void)skipToHistory;

// 我的消息
- (void)skipToMyMessage;

// 用户反馈
- (void)skipToFeedback;

// 设置
- (void)skipToSetting;

@end
