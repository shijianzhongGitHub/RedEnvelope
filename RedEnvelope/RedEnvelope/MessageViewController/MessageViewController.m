//
//  MessageController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/5.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MessageViewController.h"
#import "MyNavigationView.h"
#import "MessageCell.h"
#import "RoomViewController.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    MyNavigationView * navView;
    UITableView      * messageTableView;
    
    NSArray          * titleArray;
}

@end

@implementation MessageViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"消息" andLeftBBIImage:nil andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(MessageNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 108)];
    messageTableView.delegate = self;
    messageTableView.dataSource = self;
    [self.view addSubview:messageTableView];
    
    titleArray = @[@"我是土豪",@"我是屌丝",@"我是土鳖",@"我是水货",@"我是行货",@"我是镁铝",@"我是帅锅"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    
    if (section==1)
    {
        return 3;
    }
    
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";

    MessageCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.noticeLabel.hidden = YES;
            cell.noticeNum.hidden = YES;
            cell.applyBtn.hidden = YES;
            cell.nickLabel.text = @"我的好友(11)";
            cell.nickLabel.frame = CGRectMake(60, 20, 200, 20);
            [cell.userIcon setImage:[UIImage imageNamed:@"friends"]];
        }
        if (indexPath.row == 1)
        {
            cell.noticeLabel.hidden = YES;
            cell.applyBtn.hidden = YES;
            cell.nickLabel.frame = CGRectMake(60, 20, 260, 20);
            cell.nickLabel.text = @"斗红包公共群";
            [cell.userIcon setImage:[UIImage imageNamed:@"game"]];
        }
        if (indexPath.row == 2)
        {
            cell.noticeLabel.hidden = YES;
            cell.applyBtn.hidden = YES;
            cell.noticeLabel.hidden = NO;
            cell.nickLabel.text = @"小秘书";
            cell.noticeLabel.text = @"亲爱的玩家你好,由于你在游戏中长时间";
            [cell.userIcon setImage:[UIImage imageNamed:@"userIcon"]];
        }
    }
    else
    {
        cell.applyBtn.hidden = YES;
        cell.applyBtn.hidden = NO;
        cell.noticeLabel.hidden = NO;
        cell.nickLabel.text = [NSString stringWithFormat:@"%@",titleArray[indexPath.row]];
        cell.noticeLabel.text = @"在吗？我们可以一起玩吗？可以加你好友...";
        cell.timeLabel.text = @"09-03 22:20";
        [cell.userIcon setImage:[UIImage imageNamed:@"userIcon"]];
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RoomViewController * roomVC = [[RoomViewController alloc] init];
    roomVC.hidesBottomBarWhenPushed = YES;
    roomVC.titleString = [NSString stringWithFormat:@"%@",titleArray[indexPath.row]];
    [self.navigationController pushViewController:roomVC animated:YES];
}

- (void)MessageNavigationClick:(UIButton *)navBtn
{
    switch (navBtn.tag) {
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
