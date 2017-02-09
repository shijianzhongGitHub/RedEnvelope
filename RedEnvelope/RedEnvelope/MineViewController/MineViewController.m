//
//  MineViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/5.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MineViewController.h"
#import "MyNavigationView.h"
#import "MineCell.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * mineTableView;
}

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"我" andLeftBBIImage:nil andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(MineNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 108) style:UITableViewStyleGrouped];
    mineTableView.delegate = self;
    mineTableView.dataSource = self;
    [self.view addSubview:mineTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    
    if (section == 1)
    {
        return 2;
    }
    
    if (section == 2)
    {
        return 2;
    }
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 244;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    
    MineCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0)
    {
        cell.userDataView.hidden = NO;
        cell.accessoryView.hidden = YES;
        
        UIImageView *userIconView = [[UIImageView alloc] init];
        userIconView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-30, 20, 60, 60);
        userIconView.layer.cornerRadius = 30;
        userIconView.layer.masksToBounds = YES;
        [userIconView setImage:[UIImage imageNamed:@"userIcon"]];
        [cell.userDataView addSubview:userIconView];
        
        UILabel * nickLabel = [[UILabel alloc] init];
        nickLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-80, 90, 160, 30);
        nickLabel.textColor = [UIColor whiteColor];
        nickLabel.text = @"图嘎哈";
        nickLabel.textAlignment = NSTextAlignmentCenter;
        [cell.userDataView addSubview:nickLabel];
        
        UIButton * dataBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        dataBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 40, 80, 30);
        dataBtn.layer.borderWidth = 0.5;
        dataBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
        dataBtn.layer.cornerRadius = 5;
        [dataBtn setTitle:@"修改资料" forState:UIControlStateNormal];
        [cell.userDataView addSubview:dataBtn];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(0, 155, [UIScreen mainScreen].bounds.size.width, 0.5);
        lineView.backgroundColor = [UIColor blackColor];
        [cell.contentView addSubview:lineView];
        
        UIView * shulineView = [[UIView alloc] init];
        shulineView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, 155, 0.5, 80);
        shulineView.backgroundColor = [UIColor blackColor];
        [cell.userDataView addSubview:shulineView];
        
        UIButton * goldCoinsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        goldCoinsBtn.frame = CGRectMake(30, 140, 60, 80);
        [goldCoinsBtn setImage:[UIImage imageNamed:@"gold"] forState:UIControlStateNormal];
        [cell.userDataView addSubview:goldCoinsBtn];
        
        //现金按钮
        UIButton * cashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cashBtn.frame = CGRectMake(200, 140, 60, 80);
        [cashBtn setImage:[UIImage imageNamed:@"cash"] forState:UIControlStateNormal];
        [cell.userDataView addSubview:cashBtn];
    }
    else
    {
        cell.userDataView.hidden = YES;
    }
    
    if (indexPath.section == 1)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"vip(1)"];
            cell.textLabel.text = @"会员";
        }
        if (indexPath.row == 1)
        {
            cell.imageView.image = [UIImage imageNamed:@"market"];
            cell.textLabel.text = @"商城";
        }
    }
    
    if (indexPath.section == 2)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"playMoney"];
            cell.textLabel.text = @"充值";
        }
        if (indexPath.row == 1)
        {
            cell.imageView.image = [UIImage imageNamed:@"withdrawal"];
            cell.textLabel.text = @"提现";
        }
    }
    
    if (indexPath.section == 3)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (indexPath.row == 0)
        {
            cell.imageView.image = [UIImage imageNamed:@"setting"];
            cell.textLabel.text = @"设置";
        }
    }
    
    return cell;
}

- (void)MineNavigationClick:(UIButton *)navBtn
{
    switch (navBtn.tag)
    {
        case 101:
        {
            NSLog(@"返回");
            
        }
            break;
        case 102:
        {
            NSLog(@"下一步");
        }
        default:
            break;
    }
}

@end
