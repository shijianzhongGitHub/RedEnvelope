//
//  MessageCell.h
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/6.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) UIImageView  * userIcon;
@property (nonatomic, strong) UILabel      * nickLabel;
@property (nonatomic, strong) UILabel      * noticeLabel;
@property (nonatomic, strong) UILabel      * timeLabel;
@property (nonatomic, strong) UILabel      * noticeNum;

@property (nonatomic, strong) UIButton     * applyBtn;

@end
