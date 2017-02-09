//
//  RegisterViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/8.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UIView      * phoneNumView;
    UIView      * checkCodeView;
    UIView      * pwdView;
    UIButton    * checkCodeBtn;
    UIView      * pwdAgainView;
    UIButton    * registerBtn;
    
    MyNavigationView * navView;
}

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupRegisterUI];
}

- (void)setupRegisterUI
{
    navView=[[MyNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
    
    [navView createMyNavigationBarWithBackGroundImage:nil andTitle:@"注册" andLeftBBIImage:[UIImage imageNamed:@"back"] andLeftBBITitle:nil andRightBBIImage:nil andRightBBITitle:nil andSEL:@selector(RegisterNavigationClick:) andClass:self];
    [self.view addSubview:navView];
    
    phoneNumView = [[UIView alloc] initWithFrame:CGRectMake(20, 140, ScreenWidth-40, 50)];
    phoneNumView.layer.borderWidth = 0.5;
    phoneNumView.layer.cornerRadius = 10;
    phoneNumView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:phoneNumView];
    
    checkCodeView = [[UIView alloc] initWithFrame:CGRectMake(20, 200, (ScreenWidth-60)/2, 50)];
    checkCodeView.layer.borderWidth = 0.5;
    checkCodeView.layer.cornerRadius = 10;
    checkCodeView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:checkCodeView];
    
    checkCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-20-(ScreenWidth-60)/2, 200, (ScreenWidth-60)/2, 50)];
    checkCodeBtn.layer.borderWidth = 0.5;
    checkCodeBtn.layer.cornerRadius = 10;
    [checkCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [checkCodeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkCodeBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:checkCodeBtn];
    
    pwdView = [[UIView alloc] initWithFrame:CGRectMake(20, 260, ScreenWidth-40, 50)];
    pwdView.layer.borderWidth = 0.5;
    pwdView.layer.cornerRadius = 10;
    pwdView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:pwdView];
    
    pwdAgainView = [[UIView alloc] initWithFrame:CGRectMake(20, 320, ScreenWidth-40, 50)];
    pwdAgainView.layer.borderWidth = 0.5;
    pwdAgainView.layer.cornerRadius = 10;
    pwdAgainView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:pwdAgainView];
    
    registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 440, ScreenWidth-40, 50)];
    registerBtn.layer.borderWidth = 0.5;
    registerBtn.layer.cornerRadius = 10;
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:registerBtn];
}

- (void)RegisterNavigationClick:(UIButton *)navBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
