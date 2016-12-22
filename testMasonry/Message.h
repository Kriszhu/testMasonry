//
//  Message.h
//  实验
//
//  Created by rimi on 16/3/22.
//  Copyright © 2016年 gwf. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Message : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *content;
@property (nonatomic,assign,readonly) CGFloat cellHeight;
// 图片将要展示的frame
@property (nonatomic, assign) CGRect contentImageFrame;
+ (instancetype)messageWithDic:(NSDictionary *)dic;
@end
