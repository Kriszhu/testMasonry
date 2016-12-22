
//
//  Model.m
//  实验
//
//  Created by rimi on 16/4/6.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import "Model.h"

@implementation Model
+ (instancetype)modelWithDictionary:(NSDictionary *)dict {
    Model *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
