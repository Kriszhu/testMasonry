//
//  ScrollView.h
//  实验
//
//  Created by wanrun on 2016/12/21.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@class Message;
@interface ScrollView : UIView
@property (nonatomic, strong) Message *message;
@property (nonatomic,strong) Model *model;

//- (void)setData:(NSArray *)data;
@end
