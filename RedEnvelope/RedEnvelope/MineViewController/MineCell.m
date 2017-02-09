//
//  MineCell.m
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/7.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.userDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 244)];
        self.userDataView.backgroundColor =[UIColor grayColor];
//        self.userDataView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"userDataView"]];
        [self.contentView addSubview:self.userDataView];
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
