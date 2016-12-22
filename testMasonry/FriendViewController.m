//
//  FriendViewController.m
//  testMasonry
//
//  Created by wanrun on 2016/12/22.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "FriendViewController.h"
#import "MessageTableViewCell.h"
#import "Message.h"
#import "Model.h"
#import "ScrollView.h"
@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *data;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    self.tabBarController.tabBar.hidden = YES;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"MessageTableViewCell" bundle:nil] forCellReuseIdentifier:@"MessageTableViewCell"];
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 220)];
    view.image = [UIImage imageNamed:@"image1"];
    UIImageView *view1 = [[UIImageView alloc] initWithFrame:CGRectMake(300, 190, 60, 60)];
    view1.image = [UIImage imageNamed:@"image5"];
    [view addSubview:view1];
    self.tableView.tableHeaderView = view;
    
}
- (NSArray *)data{
    if (!_data) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages" ofType:@"plist"];
        NSArray *originArray = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"%@",originArray);
        NSMutableArray *mArry = [NSMutableArray array];
        for (NSDictionary *dic in originArray) {
            Model *mode = [Model modelWithDictionary:dic];
            [mArry addObject:mode];
        }
        _data = mArry;
    }
    return _data;
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"number%ld",self.data.count);
    return self.data.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [MessageTableViewCell calculateHeightOfCell:self.data[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageTableViewCell"];
    __weak FriendViewController *weakSelf = self;
    cell.ImageScroll = ^{
        ScrollView *scroll = [[ScrollView alloc] initWithFrame:self.view.bounds];
        scroll.model = self.data[indexPath.row];
        [weakSelf.view addSubview:scroll];
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.data[indexPath.row];
    return cell;
}



@end
