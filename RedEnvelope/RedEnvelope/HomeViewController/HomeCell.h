//
//  HomeCell.h
//  RedEnvelope
//
//  Created by 史建忠 on 16/9/5.
//  Copyright © 2016年 史建忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZScrollView.h"

@interface HomeCell : UITableViewCell
/**
 *  轮播视图
 */
@property(nonatomic, strong)UIView      * shuffLingView;
/**
 *  斗红包视图
 */
@property(nonatomic, strong)UIView      * bucketRedEnvelopeView;
/**
 *  企业红包视图
 */
@property(nonatomic, strong)UIView      * enterPriseRedEnvelopeView;

@property(nonatomic, strong)UIImageView * iconImageView;
@property(nonatomic, strong)UILabel     * nickName;
@property(nonatomic, strong)UILabel     * noticeLabel;
@property(nonatomic, strong)UIButton    * downLoadBtn;
@property(nonatomic, strong)UIButton    * redEnvelopeBtn;

@end
