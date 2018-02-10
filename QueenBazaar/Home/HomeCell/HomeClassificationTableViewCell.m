


//
//  HomeClassificationTableViewCell.m
//  QueenBazaar
//
//  Created by 李雪虎 on 2017/12/20.
//  Copyright © 2017年 李雪虎. All rights reserved.
//

#import "HomeClassificationTableViewCell.h"

@implementation HomeClassificationTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _firstBtn = [self buttoninitBtnView:CGRectMake(0, 0, width_screen/2+20, 120) with:COLOR(160, 160, 160, 1) with:@" 休闲"];
        
        _secondBtn = [self buttoninitBtnView:CGRectMake(0, 120, width_screen/2-20, 60) with:[UIColor whiteColor] with:@" 百搭"];
        
        _thirdBtn = [self buttoninitBtnView:CGRectMake(width_screen/2+20, 0, width_screen/2-20, 60) with:COLOR(238, 238, 238, 1) with:@"复古"];
        
        _fourthBtn = [self buttoninitBtnView:CGRectMake(width_screen/2-20, 60, width_screen/2+20, 140) with:COLOR(191, 191, 191, 1) with:@" 时尚"];
        
        
        [self addSubview:_secondBtn];
        [self addSubview:_thirdBtn];
        [self addSubview:_fourthBtn];
        [self addSubview:_firstBtn];
    }
    return self;
}
-(UIButton *)buttoninitBtnView:(CGRect)frame with:(UIColor *)color with:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
