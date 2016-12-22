//
//  MessageTableViewCell.h
//  实验
//
//  Created by rimi on 16/3/21.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@class Message;
typedef void(^showScroll)();
@interface MessageTableViewCell : UITableViewCell
@property (nonatomic,strong) showScroll ImageScroll;
@property (nonatomic, strong) Message *message;
@property (nonatomic,strong) Model *model;
//计算表格高度
+ (CGFloat)calculateHeightOfCell:(Model *)model;
@end
