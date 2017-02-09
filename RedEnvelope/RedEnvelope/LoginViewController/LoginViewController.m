//
//  LoginViewController.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/8.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HBTabBarController.h"

@interface LoginViewController ()
{
    UITextField  * phoneNumField;
    UITextField  * pwdTextField;
    UIButton     * logBtn;
    UIButton     * registerBtn;
    UIButton     * QQBtn;
    UIButton     * WeChatBtn;
    
    UIView       * phoneNumView;
    UIView       * pwdTextView;
    UIView       * leftlineView;
    UIView       * rightLineView;
    UILabel      * otherTitle;
    UIView       * lineView;
}

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupLoginUI];
}

- (void)setupLoginUI
{
    phoneNumView = [[UIView alloc] initWithFrame:CGRectMake(20, 130, ScreenWidth-40, 50)];
    phoneNumView.layer.borderWidth = 0.5;
    phoneNumView.layer.cornerRadius = 10;
    phoneNumView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:phoneNumView];
    
    UIImageView * phoneIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 30, 30)];
    [phoneIcon setImage:[UIImage imageNamed:@"account"]];
    [phoneNumView addSubview:phoneIcon];
    
    
    pwdTextView = [[UIView alloc] initWithFrame:CGRectMake(20, 190, ScreenWidth-40, 50)];
    pwdTextView.layer.borderWidth = 0.5;
    pwdTextView.layer.cornerRadius = 10;
    pwdTextView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.view addSubview:pwdTextView];
    
    UIImageView * pwdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 30, 30)];
    [pwdIcon setImage:[UIImage imageNamed:@"pwd"]];
    [pwdTextView addSubview:pwdIcon];
    
    phoneNumField = [[UITextField alloc] initWithFrame:CGRectMake(60, 130, 216, 102/2)];
    phoneNumField.placeholder = @"账号";
    [phoneNumField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:phoneNumField];
    
    pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(60, 190, 216, 102/2)];
    pwdTextField.placeholder = @"密码";
    [pwdTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.view addSubview:pwdTextField];
    
    logBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    logBtn.frame = CGRectMake(20, 270, ScreenWidth-40, 102/2);
    logBtn.backgroundColor = [UIColor whiteColor];
    logBtn.layer.cornerRadius = 10;
    [logBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [logBtn setTitle:@"登录" forState:UIControlStateNormal];
    [logBtn addTarget:self action:@selector(logBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logBtn];
    
    registerBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(20, 340, ScreenWidth-40, 102/2);
    registerBtn.backgroundColor = [UIColor clearColor];
    registerBtn.layer.cornerRadius = 10;
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    CGFloat otherTitleW = 120;
    
    leftlineView = [[UIView alloc] initWithFrame:CGRectMake(10, ScreenHeight-180, (ScreenWidth-30-otherTitleW)/2, 0.5)];
    leftlineView.backgroundColor = DHBColor(255, 255, 255, 0.6);
    [self.view addSubview:leftlineView];
    
    otherTitle = [[UILabel alloc] initWithFrame:CGRectMake(10+leftlineView.bounds.size.width+5, ScreenHeight-190, otherTitleW, 20)];
    otherTitle.textColor = [UIColor whiteColor];
    otherTitle.text = @"其他方式登录";
    otherTitle.textAlignment = NSTextAlignmentCenter;
    otherTitle.font = [UIFont boldSystemFontOfSize:14];
    [self.view addSubview:otherTitle];
    
    rightLineView = [[UIView alloc] initWithFrame:CGRectMake(20+leftlineView.bounds.size.width+otherTitleW, ScreenHeight-180, (ScreenWidth-30-otherTitleW)/2, 0.5)];
    rightLineView.backgroundColor = DHBColor(255, 255, 255, 0.6);
    [self.view addSubview:rightLineView];
    
    QQBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    QQBtn.frame = CGRectMake(70, ScreenHeight-120, 60, 80);
    [QQBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0,30,QQBtn.titleLabel.bounds.size.width-13)];
    [QQBtn setTitleEdgeInsets:UIEdgeInsetsMake(QQBtn.imageView.bounds.size.height, -QQBtn.bounds.size.width+20, -25, 0)];
    QQBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [QQBtn setTitle:@"QQ" forState:UIControlStateNormal];
    [QQBtn setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
    [self.view addSubview:QQBtn];
    
    
    WeChatBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    WeChatBtn.frame = CGRectMake(ScreenWidth-130, ScreenHeight-120, 60, 80);
    [WeChatBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0,30,WeChatBtn.titleLabel.bounds.size.width-24)];
    [WeChatBtn setTitleEdgeInsets:UIEdgeInsetsMake(WeChatBtn.imageView.bounds.size.height, -WeChatBtn.bounds.size.width+20, -25, 0)];
    WeChatBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [WeChatBtn setTitle:@"微信" forState:UIControlStateNormal];
    [WeChatBtn setImage:[UIImage imageNamed:@"WeChat"] forState:UIControlStateNormal];
    [self.view addSubview:WeChatBtn];
    
}

- (void)logBtnClick:(UIButton *)Btn
{
    HBTabBarController * hbtabBarVC = [[HBTabBarController alloc] init];
    [self.navigationController pushViewController:hbtabBarVC animated:NO];
}

- (void)registerBtnClick:(UIButton *)Btn
{
    RegisterViewController * registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

@end
