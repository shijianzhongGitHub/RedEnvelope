//
//  OneYuanViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/7.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "NumberYuanViewController.h"
#import "MyNavigationView.h"

@interface NumberYuanViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView         * oneYuanTableView;
    MyNavigationView    * navView;
}
@end

@implementation NumberYuanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:self.navigationItem.title andLeftBBIImage:[UIImage imageNamed:@"back"] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(numYuanNavigationClick:) andClass:self];
    [self.view addSubview:navView];
        
    oneYuanTableView = [[UITableView alloc] init];
    oneYuanTableView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 60);
    oneYuanTableView.delegate = self;
    oneYuanTableView.dataSource = self;
    [self.view addSubview:oneYuanTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row == 0)
    {
        UIButton * quickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        quickBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2-0.5, 44);
        [quickBtn setTitle:@"快速开始" forState:UIControlStateNormal];
        [quickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [quickBtn setBackgroundColor:DHBColor(222, 222, 222, 1.0)];
        quickBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:quickBtn];
        
        UIButton * PrivateRoomsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        PrivateRoomsBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2+0.5, 0, [UIScreen mainScreen].bounds.size.width/2, 44);
        [PrivateRoomsBtn setTitle:@"创建房间" forState:UIControlStateNormal];
        [PrivateRoomsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [PrivateRoomsBtn setBackgroundColor:DHBColor(222, 222, 222, 1.0)];
        PrivateRoomsBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [cell.contentView addSubview:PrivateRoomsBtn];
    }
    
    return cell;
}

- (void)numYuanNavigationClick:(UIButton *)numYuanNavigationClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
