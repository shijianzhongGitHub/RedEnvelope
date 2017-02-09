//
//  HomeCell.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/5.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.shuffLingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        [self.contentView addSubview:self.shuffLingView];
        self.shuffLingView.backgroundColor = [UIColor redColor];
        
        self.bucketRedEnvelopeView = [[UIView alloc] initWithFrame:CGRectMake(0, 2, ScreenWidth, 126)];
        UILabel * bucketTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        bucketTitleLabel.text = @"斗红包";
        bucketTitleLabel.font = [UIFont systemFontOfSize:14];
        bucketTitleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.bucketRedEnvelopeView];
        [self.bucketRedEnvelopeView addSubview:bucketTitleLabel];
        self.bucketRedEnvelopeView.hidden = YES;
        
        self.enterPriseRedEnvelopeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
        UILabel * enterPriseTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        enterPriseTitleLabel.text = @"企业红包";
        enterPriseTitleLabel.font = [UIFont systemFontOfSize:14];
        enterPriseTitleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.enterPriseRedEnvelopeView];
        [self.enterPriseRedEnvelopeView addSubview:enterPriseTitleLabel];
        
        UILabel * taskRedTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, 100, 20)];
        taskRedTitleLabel.text = @"任务红包";
        taskRedTitleLabel.font = [UIFont systemFontOfSize:14];
        taskRedTitleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:self.enterPriseRedEnvelopeView];
        [self.enterPriseRedEnvelopeView addSubview:taskRedTitleLabel];
        self.enterPriseRedEnvelopeView.hidden = YES;
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 12, 40, 40)];
        self.nickName = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 25)];
        self.nickName.font = [UIFont systemFontOfSize:14];
        self.noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 120, 25)];
        self.noticeLabel.font = [UIFont systemFontOfSize:10];
        self.noticeLabel.textColor = [UIColor redColor];
        self.downLoadBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth-90, 15, 80, 30)];
        self.iconImageView.hidden = YES;
        self.nickName.hidden = YES;
        self.downLoadBtn.hidden = YES;
        self.noticeLabel.hidden = YES;

        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.nickName];
        [self.contentView addSubview:self.noticeLabel];
        [self.contentView addSubview:self.downLoadBtn];
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
