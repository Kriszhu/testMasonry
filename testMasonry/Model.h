//
//  Model.h
//  实验
//
//  Created by rimi on 16/4/6.
//  Copyright © 2016年 gwf. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define yxColorFromRGBA(_r,_g,_b,_a) [UIColor colorWithRed:_r/255.0f green:_g/255.0f blue:_b/255.0f alpha:_a]
#define yxColorFromWA(_w,_a) [UIColor colorWithWhite:_w alpha:_a]
#define yxImageFromName(_name) [UIImage imageNamed:_name]
@interface Model : NSObject
///初始化方法
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@property (nonatomic, strong) NSArray *imageName;
@property (nonatomic, strong) NSString *content;

@end
