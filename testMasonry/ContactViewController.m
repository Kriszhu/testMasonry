//
//  ContactViewController.m
//  testMasonry
//
//  Created by wanrun on 2016/12/16.
//  Copyright © 2016年 wanrun. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"
#define __async_opt__  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define __async_main__ dispatch_async(dispatch_get_main_queue()

@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) UIButton *nFriendsBtn;
@property (nonatomic,strong) UIButton *chatBtn;
@property (nonatomic,strong) UIButton *publicBtn;
@property (nonatomic,strong) UISearchBar *search;
@property(nonatomic, strong) NSMutableArray *saveIndexArr;
@property(nonatomic, strong) NSArray *sectionArr;

@end


@implementation ContactViewController
-(NSMutableArray *)saveIndexArr{
    if (_saveIndexArr == nil) {
        _saveIndexArr = [NSMutableArray array];
    }
    return _saveIndexArr;
}
-(NSArray *)sectionArr{
    if (_sectionArr == nil) {
        _sectionArr = [[NSArray alloc]initWithObjects:
                       @[],
                       @[],
                       @[],
                       @[@"lol",@"peter"],
                       @[],
                       @[@"kris",@"lina",@"fiona",@"Alice",@"julia"],
                       @[@"enhe",@"lili"],
                       @[@"heji",@"唐帅南",@"杨恩泽",@"袁竹康",@"邵永国"],
                       @[@"akf",@"sas",@"wendy"],
                       @[@"dad",@"mom"],
                       @[],
                       nil];
    }
    return _sectionArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联系人";
    [self setTable];
    self.dataSource = @[@"",@"特别关心",@"常用群聊",@"不熟",@"me",@"初中同学",@"好友",@"高中同学",@"大学同学",@"亲友",@"万润Ltd"];
    for (int i = 0; i<self.sectionArr.count; i++) {
        
        [self.saveIndexArr addObject:@"0"];
        
    }

    
}

- (void)setTable {
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if ([[self.saveIndexArr objectAtIndex:section] isEqualToString:@"1"]) {
        
        return [[self.sectionArr objectAtIndex:section] count];
    }else{
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell1) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    cell1.textLabel.text = self.sectionArr[indexPath.section][indexPath.row];
        return cell1;


}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
        _search = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 5, 335, 25)];
        _search.placeholder = @"搜索";
        [view addSubview:self.search];
        _nFriendsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nFriendsBtn.frame = CGRectMake(0, 35, 125, 80);
        [_nFriendsBtn setImage:[UIImage imageNamed:@"新朋友"] forState:UIControlStateNormal];
        [view addSubview:self.nFriendsBtn];
        
        _chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _chatBtn.frame = CGRectMake(125, 35,
                                    125, 80);
        [_chatBtn setImage:[UIImage imageNamed:@"群聊"] forState:UIControlStateNormal];
        [view addSubview:self.chatBtn];
        
        _publicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _publicBtn.frame = CGRectMake(250, 35, 125, 80);
        [_publicBtn setImage:[UIImage imageNamed:@"公众号"] forState:UIControlStateNormal];
        [view addSubview:self.publicBtn];
        return view;
    }else {
    UIButton *headerView = [UIButton buttonWithType:UIButtonTypeSystem];
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    NSString *name = self.dataSource[section];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 12, 200, 20)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:13];
    [headerView addSubview:label];
    headerView.backgroundColor = [UIColor whiteColor];
    headerView.alpha = 1;
    headerView.tag = section;
    headerView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    headerView.layer.borderWidth = 0.3;
    if (section != 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 17, 6, 10)];
        imageView.image = [UIImage imageNamed:@"enter3"];
        [headerView addSubview:imageView];
        [headerView addTarget:self action:@selector(headViewPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return headerView;
    }
}

- (void)headViewPressed:(UIButton *)sender {
    if ([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"0"]) {
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"1"];
    }else if([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"1"]){
        
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    
    [self.table reloadData];


}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0||section ==2) {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
        view.backgroundColor = [UIColor lightGrayColor];
        view.alpha = 0.2;
        return view;
    } else {
        return nil;
    }
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 115;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 30;
    }else {
        return 0;
    }
}

@end
