//
//  RoomViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/13.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "RoomViewController.h"

@interface RoomViewController ()
{
     MyNavigationView * navView;
}

@end

@implementation RoomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:self.titleString andLeftBBIImage:[UIImage imageNamed:@"back"] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(RoomNavigationClick:) andClass:self];
    [self.view addSubview:navView];
}

- (void)RoomNavigationClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
