//
//  HomeViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/5.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "HomeViewController.h"
#import "MyNavigationView.h"
#import "HomeCell.h"
#import "NumberYuanViewController.h"
#import "JZScrollView.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,JZScrollViewNetDelegate>
{
    MyNavigationView * navView;
    UITableView      * homeTableView;
}

/** 图片数组 */
@property (nonatomic, strong) NSArray * netImages;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (NSArray *)netImages
{
    if (!_netImages)
    {
        _netImages = @[@"http://ws.xzhushou.cn/focusimg/201508201549023.jpg",@"http://ws.xzhushou.cn/focusimg/52.jpg",@"http://ws.xzhushou.cn/focusimg/51.jpg",@"http://ws.xzhushou.cn/focusimg/50.jpg"];
    }
    
    return _netImages;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"斗红包" andLeftBBIImage:[UIImage imageNamed:@"signIn"] andLeftBBITitle:nil andRightBBIImage:[UIImage imageNamed:@"share"] andRightBBITitle:nil andSEL:@selector(HomeNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    homeTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-76) style:UITableViewStyleGrouped];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    homeTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:homeTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 200;
    }
    if (indexPath.row == 1)
    {
        return 120;
    }
    if (indexPath.row == 2)
    {
        return 260;
    }
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"";
    
    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray * redEnvelopeArray = [NSArray arrayWithObjects:@"group(1)78x78",@"group(2yuan)78x78",@"group(5yuan)",@"group(tuhao)78x78", nil];
    NSArray * redEnvelopeTitleArr = [NSArray arrayWithObjects:@"一元区",@"二元区",@"五元区",@"土豪区", nil];
    
    NSArray * enterPriseArray = [NSArray arrayWithObjects:@"group(11)74x67",@"group(11)74x67",@"group(11)74x67",@"group(11)74x67",@"group(11)74x67",@"group(11)74x67",@"group(11)74x67",@"group(11)74x67", nil];
    NSArray * enterPriseTitleArr = [NSArray arrayWithObjects:@"已抢300/2000",@"已抢300/2000",@"已抢300/2000",@"已抢300/2000",@"已抢300/2000",@"已抢300/2000",@"已抢300/2000",@"已抢300/2000", nil];
    
    if (indexPath.row == 0)
    {
        cell.shuffLingView.hidden = NO;
        cell.iconImageView.hidden = YES;
        cell.nickName.hidden = YES;
        cell.downLoadBtn.hidden = YES;
        cell.noticeLabel.hidden = YES;
        JZScrollView * scrollView = [[JZScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200) WithNetImages:self.netImages];
//        JZScrollView * scrollView = [[JZScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 146)];
        scrollView.AutoScrollDelay = 3;
        scrollView.netDelagate = self;
        scrollView.placeholderImage = [UIImage imageNamed:@"banner375x146"];
        [cell.shuffLingView addSubview:scrollView];
    }
    else
    {
        cell.shuffLingView.hidden = YES;
    }
    
    if (indexPath.row == 1)
    {
        cell.bucketRedEnvelopeView.hidden = NO;
        cell.iconImageView.hidden = YES;
        cell.nickName.hidden = YES;
        cell.downLoadBtn.hidden = YES;
        cell.noticeLabel.hidden = YES;
        
        CGFloat redEvenlopeBtnW = 60;
        CGFloat redEvenlopeBtnH = redEvenlopeBtnW;
        CGFloat margin = (ScreenWidth-redEnvelopeArray.count*redEvenlopeBtnW)/(redEnvelopeArray.count+1);
        
        
        for (int i=0; i<redEnvelopeArray.count; i++)
        {
            UIButton * redEnvelopeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            redEnvelopeBtn.frame = CGRectMake(margin+i*(redEvenlopeBtnW+margin), 35, redEvenlopeBtnW, redEvenlopeBtnH);
            redEnvelopeBtn.layer.cornerRadius = 30;
            redEnvelopeBtn.tag = i;
            [redEnvelopeBtn setImage:[UIImage imageNamed:[redEnvelopeArray objectAtIndex:i]] forState:UIControlStateNormal];
            [redEnvelopeBtn setTitle:[redEnvelopeTitleArr objectAtIndex:i] forState:UIControlStateNormal];
            [redEnvelopeBtn addTarget:self action:@selector(redEnvelopeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.bucketRedEnvelopeView addSubview:redEnvelopeBtn];
        }
    }
    else
    {
        cell.bucketRedEnvelopeView.hidden = YES;
    }
    
    if (indexPath.row == 2)
    {
        cell.enterPriseRedEnvelopeView.hidden = NO;
        cell.iconImageView.hidden = YES;
        cell.nickName.hidden = YES;
        cell.downLoadBtn.hidden = YES;
        cell.noticeLabel.hidden = YES;
        
        CGFloat enterPriseBtnW = 80;
        CGFloat enterPriseBtnH = 100;
        CGFloat margin = (ScreenWidth-redEnvelopeArray.count*enterPriseBtnW)/(redEnvelopeArray.count+1);
        
        
        for (int j=0; j<enterPriseArray.count; j++)
        {
            UIButton * enterPriseBtn =[UIButton buttonWithType:UIButtonTypeCustom];
            if (j>3)
            {
                enterPriseBtn.frame = CGRectMake(margin+(j-4)*(enterPriseBtnW+margin), 130, enterPriseBtnW, enterPriseBtnH);
            }
            else
            {
                enterPriseBtn.frame = CGRectMake(margin+j*(enterPriseBtnW+margin), 25, enterPriseBtnW, enterPriseBtnH);
            }
            enterPriseBtn.tag = j;
            [enterPriseBtn setImage:[UIImage imageNamed:[enterPriseArray objectAtIndex:j]] forState:UIControlStateNormal];
            [enterPriseBtn setTitle:[enterPriseTitleArr objectAtIndex:j] forState:UIControlStateNormal];
            
            [enterPriseBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0,20,enterPriseBtn.titleLabel.bounds.size.width-6)];
            [enterPriseBtn setTitleEdgeInsets:UIEdgeInsetsMake(enterPriseBtn.imageView.bounds.size.height, -enterPriseBtn.bounds.size.width+5, -5, 0)];
            
            [enterPriseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            enterPriseBtn.titleLabel.font = [UIFont systemFontOfSize:10];
            [cell.enterPriseRedEnvelopeView addSubview:enterPriseBtn];

        }
    }
    else
    {
        cell.enterPriseRedEnvelopeView.hidden = YES;
        cell.iconImageView.hidden = YES;
        cell.nickName.hidden = YES;
        cell.downLoadBtn.hidden = YES;
        cell.noticeLabel.hidden = YES;
    }
    
    if (indexPath.row > 2)
    {
        cell.iconImageView.hidden = NO;
        cell.nickName.hidden = NO;
        cell.downLoadBtn.hidden = NO;
        cell.noticeLabel.hidden = NO;
        
        [cell.iconImageView setImage:[UIImage imageNamed:@"game"]];
        cell.nickName.text = @"神庙逃亡";
        cell.noticeLabel.text = @"首次下载可得1元现金红包";
        [cell.downLoadBtn setImage:[UIImage imageNamed:@"down50x20"] forState:UIControlStateNormal];
    }
    
    return cell;
    
}

- (void)redEnvelopeBtnClick:(UIButton *)button
{
    NumberYuanViewController * numYuanVC = [[NumberYuanViewController alloc] init];
    numYuanVC.hidesBottomBarWhenPushed = YES;
    numYuanVC.navigationItem.title = button.titleLabel.text;
    [self.navigationController pushViewController:numYuanVC animated:YES];
}

- (void)HomeNavigationClick:(UIButton *)navBtn
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
