//
//  ScrollView.m
//  实验
//
//  Created by wanrun on 2016/12/21.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import "ScrollView.h"
#import "Message.h"
#define Width  (self.bounds.size.width)
#define Height (self.bounds.size.height)
@interface ScrollView()
@property (nonatomic,strong) UIScrollView *scroll;
@end
@implementation ScrollView

- (void)setModel:(Model *)model {
    if (_model != model) {
        _model = model;
    }

    [self setData:model.imageName];
    
}
- (void)setData:(NSArray *)data {
    self.scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scroll.backgroundColor = [UIColor blackColor];
    self.scroll.showsVerticalScrollIndicator = NO;
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.pagingEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGe:)];
    [self.scroll addGestureRecognizer:tap];
    NSInteger number = data.count;
    self.scroll.contentSize = CGSizeMake((Width)*number, Height);
     [self addSubview:self.scroll];
  
    for (NSInteger i = 0;i < number ; ++i) {
          UIImageView *img = [[UIImageView alloc] init];
        img.frame = CGRectMake((Width)*i,Height/4 , Width, Height/2);
        img.image = [UIImage imageNamed:data[i]];
        [self.scroll addSubview:img];
    }

}
- (void)tapGe:(UITapGestureRecognizer *)tapGe {
    [UIView animateWithDuration:1 animations:^{
        [self removeFromSuperview];
    }];
   

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.scroll removeFromSuperview];

}
@end
