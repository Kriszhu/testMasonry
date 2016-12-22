//
//  MessageTableViewCell.m
//  实验
//
//  Created by rimi on 16/3/21.
//  Copyright © 2016年 gwf. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "Message.h"
#define maxW ([UIScreen mainScreen].bounds.size.width-50-28-6)//发送文字信息最宽的宽度
#define zfImageTypeOne CGSizeMake(maxW/2.3,maxW/1.8)//如果是一张图片
#define zfImageTypeTwo CGSizeMake((maxW-20)/3,(maxW-20)/3)//如果大于一张图片
@interface MessageTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (nonatomic,strong) UILabel *contentLabel;
@property (strong,nonatomic) UIImageView *contentImage;
@property (nonatomic,assign) CGFloat Height;
@property (nonatomic,strong) NSMutableArray *image;

@end
@implementation MessageTableViewCell

- (void)setModel:(Model *)model {
    if (_model != model) {
        _model = model;
        //删除多余的label 避免重复
        [self.contentLabel removeFromSuperview];
        self.contentLabel = nil;
    }
     [self addContentLable:model.content];
    [self addImage:model.imageName];
     

}
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (NSMutableArray *)image {
    if (!_image) {
        _image = [NSMutableArray array];
    }
    return _image;
}
- (void)addImage:(NSArray *)images {
    NSLog(@"zhuf%@",images);
    for (UIView *view in self.image) {
        [view removeFromSuperview];
    }

    
    if (images.count == 0 || !images) {
        return;
    }else if (images.count == 1) {
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(60, 60+_Height+5, zfImageTypeOne.width, zfImageTypeOne.width);
                NSLog(@"lslss%f",_Height);
        imageView.image = [UIImage imageNamed:images[0]];
        [self.contentView addSubview:imageView];
        [self.image addObject:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showScrollImage:)];
        [imageView addGestureRecognizer:tap];

    }else {
        for (int i = 0; i < images.count; ++i) {
            UIImageView * imageView = [[UIImageView alloc] init];
            imageView.userInteractionEnabled = YES;
            imageView.frame = CGRectMake(40+(zfImageTypeTwo.width+5)*((i)%3), 60+_Height+5+(zfImageTypeTwo.width+5)*(i/3), zfImageTypeTwo.width,zfImageTypeTwo.width);
            imageView.image = [UIImage imageNamed:images[i]];
            [self.contentView addSubview:imageView];
            [self.image addObject:imageView];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showScrollImage:)];
            [imageView addGestureRecognizer:tap];

        }
    }

}

- (void)addContentLable:(NSString *)text {
    NSLog(@"text%@",text);
    if (text.length != 0) {
        //添加label
//        CGSize size = [text boundingRectWithSize:CGSizeMake(maxW,0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size;
         _Height = [text boundingRectWithSize:CGSizeMake(maxW,0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size.height;
        self.contentLabel.frame = CGRectMake(40, 60, maxW, _Height);
        self.contentLabel.text = text;
        [self.contentView addSubview:self.contentLabel];
    } else {
        return;
    }
    
}

- (void)showScrollImage:(UITapGestureRecognizer *)gesture {
    if (self.ImageScroll) {
        self.ImageScroll();
    }

}
+(CGFloat)calculateHeightOfCell:(Model *)model {
    //计算text
    CGSize textSize;
    if (model.content.length == 0) {
        textSize = CGSizeZero;
    }else {
        textSize = [model.content boundingRectWithSize:CGSizeMake(maxW,0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size;
    }
    //计算image 限制图片最多为三行9张
    NSLog(@"%ld",model.imageName.count);
    CGFloat height = 0;
    if (model.imageName.count == 0) {
        height = 0;
    }else if (model.imageName.count == 1) {
        height = zfImageTypeOne.height;
    }else  if (model.imageName.count <= 3) {
            height = 5+zfImageTypeTwo.height;
        }else if (model.imageName.count <= 6) {
            height = 10+zfImageTypeTwo.height*2;
        }else {
            height = 15+zfImageTypeTwo.height*3;
        }
    if (model.content.length == 0 && height == 0) {
        return 0;
    } else {
     NSLog(@"1height%f",textSize.height );
     NSLog(@"height%f",height);
    NSLog(@"height%f",textSize.height +height +15);
    return textSize.height+height+65;
    }
}


@end
