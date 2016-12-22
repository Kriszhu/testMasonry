//
//  MessageViewController.m
//  testMasonry
//
//  Created by wanrun on 2016/12/16.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "MessageViewController.h"
#import "ContactTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSArray *im;
@property (nonatomic,strong) NSArray *name;
@property (nonatomic,strong)  UISegmentedControl *selectTypeSegment;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation MessageViewController
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.contentSize = CGSizeMake((self.view.bounds.size.width)*2, self.view.bounds.size.height);
        _scrollView.scrollEnabled = NO;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:self.scrollView];

    
    }
    return _scrollView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _selectTypeSegment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"消息", @"电话", nil]];
    [_selectTypeSegment setFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 120)/2, 8, 120, 28)];
    [_selectTypeSegment setSelectedSegmentIndex:0];
    [_selectTypeSegment addTarget:self action:@selector(changView:) forControlEvents:UIControlEventValueChanged];
    [self.navigationController.navigationBar addSubview:_selectTypeSegment];
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.rowHeight = 70;
//    [self.view addSubview:self.table];
    [self.scrollView addSubview:self.table];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(375, 0, 375, 667)];
    view.backgroundColor =[UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 90, 20)];
    label.text = @"no call";
    [view addSubview:label];
    [self.scrollView addSubview:view];
        self.im= @[@"1",@"3",@"4",@"3",@"4",@"3",@"4",@"3",@"4"];
    self.name = @[@"nina",@"sss",@"lala",@"w魏凯",@"邵永国",@"杨恩泽",@"王自晟",@"徐子越",@"乔艳"];
    
}

- (void)changView:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    } else {
        [self.scrollView setContentOffset:CGPointMake(375, 0)];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *data = @[self.im[indexPath.row],self.name[indexPath.row]];
    [cell setData:data];

    return cell;
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *TextRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
    
    }];
    TextRowAction.backgroundColor = [UIColor redColor];
     NSArray *kind = [NSArray array];
    kind = @[TextRowAction];
    return kind;

}

@end
