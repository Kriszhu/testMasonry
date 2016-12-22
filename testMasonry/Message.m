
//
//  Message.m
//  实验
//
//  Created by rimi on 16/3/22.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import "Message.h"
static CGFloat const margin = 10;
static CGFloat const contentFont = 18;
static CGFloat const contentLabelY = margin + 30.f + margin; // 30是头像高度
@implementation Message {
     CGFloat _cellHeight;

}
+ (instancetype)messageWithDic:(NSDictionary *)dic {
    Message *message = [[self alloc] init];
    [message setValuesForKeysWithDictionary:dic];
    return message;
}
- (CGFloat)cellHeight{
    if (!_cellHeight) {
        // 屏幕宽度减去左右间距
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin;
        //内容文本的高度
        CGFloat contentH = [self.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                      context:nil].size.height;
        _cellHeight = contentLabelY + contentH + margin;
        if (self.imageName.length) {
            UIImage *image = [UIImage imageNamed:self.imageName];
            CGFloat imageH = image.size.height;
            CGFloat imageW = image.size.width;
            _contentImageFrame = CGRectMake(margin, _cellHeight, imageW, imageH);
            _cellHeight += imageH + margin;
        }
    }
    return _cellHeight;

}

@end
