//
//  MessageCell.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/6.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [self.contentView addSubview:self.userIcon];
        
        self.nickLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 100, 20)];
        [self.contentView addSubview:self.nickLabel];
        
        self.noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 35, 200, 20)];
        self.noticeLabel.textColor = [UIColor grayColor];
        self.noticeLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.noticeLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 90, 10, 100, 20)];
        self.timeLabel.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:self.timeLabel];
        
        self.noticeNum = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 40, 30, 20, 20)];
        self.noticeNum.layer.cornerRadius = 10;
        self.noticeNum.layer.masksToBounds = YES;
        self.noticeNum.text = @"99+";
        self.noticeNum.font = [UIFont systemFontOfSize:8];
        self.noticeNum.textColor = [UIColor whiteColor];
        self.noticeNum.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.noticeNum];
        
        self.applyBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 90, 10, 80, 30)];
        self.applyBtn.backgroundColor = [UIColor grayColor];
        [self.applyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.applyBtn.titleLabel.font = [UIFont systemFontOfSize:10];
//        [self.contentView addSubview:self.applyBtn];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
