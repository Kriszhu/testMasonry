//
//  ContactTableViewCell.m
//  testMasonry
//
//  Created by wanrun on 2016/12/19.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "ContactTableViewCell.h"
@interface ContactTableViewCell()

@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *nickName;

@end
@implementation ContactTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _headImg.layer.cornerRadius = 25;
        _headImg.clipsToBounds = YES;
        [self addSubview:_headImg];
        _nickName = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 100, 15)];
        _nickName.font = [UIFont systemFontOfSize:14];
        [self addSubview:_nickName];
    }
    return self;
}
- (void)setData:(NSArray *)dic {
    _headImg.image = [UIImage imageNamed:dic[0]];
    _nickName.text = dic[1];

}
@end
