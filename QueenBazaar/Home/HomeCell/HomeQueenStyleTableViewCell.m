//
//  HomeQueenStyleTableViewCell.m
//  QueenBazaar
//
//  Created by 李雪虎 on 2017/12/20.
//  Copyright © 2017年 李雪虎. All rights reserved.
//

#import "HomeQueenStyleTableViewCell.h"

@implementation HomeQueenStyleTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _firstBtn = [self buttoninitBtnView:CGRectMake(0, 0, width_screen/3*2-10, 100) with:COLOR(229, 229, 229, 1) with:@""];
        _secondBtn = [self buttoninitBtnView:CGRectMake(width_screen/3*2, 0, width_screen/3, 100) with:COLOR(229, 229, 229, 1) with:@""];
        _thirdBtn = [self buttoninitBtnView:CGRectMake(0, 110, width_screen/5*2, 100) with:COLOR(229, 229, 229, 1) with:@""];
        _fourthBtn = [self buttoninitBtnView:CGRectMake(width_screen/5*2+10, 110, width_screen/5*3, 100) with:COLOR(229, 229, 229, 1) with:@""];
        
        [self addSubview:_firstBtn];
        [self addSubview:_secondBtn];
        [self addSubview:_thirdBtn];
        [self addSubview:_fourthBtn];
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UIButton *)buttoninitBtnView:(CGRect)frame with:(UIColor *)color with:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    return button;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
