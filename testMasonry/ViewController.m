//
//  ViewController.m
//  testMasonry
//
//  Created by wanrun on 2016/11/4.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *blueview;

@property (nonatomic,strong) UIButton *growingButton;

@property (nonatomic,assign) CGFloat scale;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    s
//    UIView *topView = [[UIView alloc] init];
//    [topView setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:topView];
//    
//    UIView *topInnerView = [[UIView alloc] init];
//    [topInnerView setBackgroundColor:[UIColor greenColor]];
//    [topView addSubview:topInnerView];
//    
//    UIView *bottomView = [[UIView alloc] init];
//    [bottomView setBackgroundColor:[UIColor orangeColor]];
//    [self.view addSubview:bottomView];
//    
//    UIView *bottomInnerview = [[UIView alloc] init];
//    [bottomInnerview setBackgroundColor:[UIColor blueColor]];
//    [bottomView addSubview:bottomInnerview];
//    
//    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(bottomView);
//    }];
//    
//    [topInnerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.width.mas_equalTo(topInnerView.mas_height).multipliedBy(3);
//        make.center.mas_equalTo(topView);
//    }];
//    
//    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.right.mas_equalTo(0);
//        make.height.mas_equalTo(topView);
//        make.top.mas_equalTo(topView.mas_bottom);
//    }];
//    
//    [bottomInnerview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.mas_equalTo(bottomView);
//        make.height.mas_equalTo(bottomInnerview.mas_width).multipliedBy(3);
//        make.center.mas_equalTo(bottomView);
//    }];
//    
//    [self creatGrowingButton];
    
    
    
 

}

//- (void)creatGrowingButton {
//    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.growingButton setTitle:@"点击我放大" forState:UIControlStateNormal];
//    self.growingButton.layer.borderColor = [UIColor greenColor].CGColor;
//    self.growingButton.layer.borderWidth = 3;
//    [self.growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.growingButton];
//    self.scale = 1.0;
//    
//    [self.growingButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(self.view);
//        make.width.height.mas_equalTo(100*self.scale);
//        make.width.height.lessThanOrEqualTo(self.view);
//    }];
//    
//
//}
//
//- (void)onGrowButtonTaped:(UIButton *)sender {
//    self.scale += 1.0;
//    [self.view setNeedsUpdateConstraints];
//    
//    [self.view updateConstraintsIfNeeded];
//    [UIView animateWithDuration:0.3 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//
//}
///*重写方法跟新约束*/
//- (void)updateViewConstraints {
//    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(100*self.scale);
//    }];
//    [super updateViewConstraints];
//
//}
////- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.blueview removeFromSuperview];
//    [UIView animateWithDuration:10.0 animations:^{
//        [self.view layoutIfNeeded];
//    }];
//
//}

@end
