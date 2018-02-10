//
//  HomeThemeTableViewCell.m
//  QueenBazaar
//
//  Created by 李雪虎 on 2017/12/19.
//  Copyright © 2017年 李雪虎. All rights reserved.
//

#import "HomeThemeTableViewCell.h"

@implementation HomeThemeTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        // 斜挎
        _xieBtn = [self buttoninitBtnView:CGRectMake(width_screen/2-25, -32, width_screen/4+5,190 ) with:[UIColor whiteColor] with:@"斜挎"];
        _xieBtn.transform = CGAffineTransformMakeRotation(M_LOG10E);
        [self addSubview:_xieBtn];
        
        //手持
        _handBtn = [self buttoninitBtnView:CGRectMake(width_screen/4*3-20, -15, width_screen/3+8, 205) with:COLOR(220, 220, 220, 1) with:@"手持"];
        [self addSubview:_handBtn];
        _handBtn.transform = CGAffineTransformMakeRotation(M_LOG10E);
        
        
        
        //单肩
       _danBtn = [self buttoninitBtnView:CGRectMake(0, 0, width_screen/2, 75) with:COLOR(220, 220, 220, 1) with:@"单肩"];
        [self addSubview:_danBtn];
        [_danBtn bringSubviewToFront:self];
        //双肩
        _shuangBtn = [self buttoninitBtnView:CGRectMake(0, 75, width_screen/2, 75) with:COLOR(246, 246, 246, 1) with:@"双肩"];
        [self addSubview:_shuangBtn];
        [_shuangBtn bringSubviewToFront:self];
        
        self.clipsToBounds = YES;
        
    }
    return self;
}
-(UIButton *)buttoninitBtnView:(CGRect)frame with:(UIColor *)color with:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
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
