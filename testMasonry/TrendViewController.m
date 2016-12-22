//
//  TrendViewController.m
//  testMasonry
//
//  Created by wanrun on 2016/12/16.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "TrendViewController.h"
#import "FriendViewController.h"
#define __async_opt__  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define __async_main__ dispatch_async(dispatch_get_main_queue()
@interface TrendViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableV;
    NSMutableArray *_arData;
}



@end

@implementation TrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"动态"];
    _tableV = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableV.dataSource = self;
    _tableV.delegate = self;
    [self.view addSubview:_tableV];
    
    [self initData];

    
}
- (void)initData
{
    __async_opt__, ^
    {
        _arData = [NSMutableArray new];
        
        NSArray *ar1 = @[@"好友动态"];
        NSArray *ar2 = @[@"游戏", @"福利", @"阅读"];
        NSArray *ar3 = @[@"文件/照片 助手", @"吃喝玩乐", @"扫一扫", @"热门活动", @"腾讯新闻"];
        NSArray *ar4 = @[@"附近的人", @"附近的群", @"兴趣部落"];
        
        [_arData addObject:ar1];
        [_arData addObject:ar2];
        [_arData addObject:ar3];
        [_arData addObject:ar4];
        
        __async_main__, ^
        {
            [_tableV reloadData];
        });
    });
}

#pragma mark - action

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_arData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_arData objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [[_arData objectAtIndex:[indexPath section]] objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 19;
    }
    return 18;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        FriendViewController *friend = [[FriendViewController alloc] init];
        [self.navigationController pushViewController:friend animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
