//
//  HomeRecommendTableViewCell.m
//  QueenBazaar
//
//  Created by 李雪虎 on 2017/12/20.
//  Copyright © 2017年 李雪虎. All rights reserved.
//

#import "HomeRecommendTableViewCell.h"

@implementation HomeRecommendTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _firstImgBtn = [self buttoninitBtnView:CGRectMake(0, 0, width_screen/2+20, 120) with:COLOR(242, 242, 242, 1) with:@"图片"];
        _firstTitleBtn = [self buttoninitBtnView:CGRectMake(10, 120, width_screen/2-40, 60) with:[UIColor whiteColor] with:@"如果你无法简洁的表达你的想法那只说明你还\n   ￥20000 ❤️"];
        _secondImgBtn = [self buttoninitBtnView:CGRectMake(width_screen/2-20, 60, width_screen/2+20, 120) with:COLOR(217, 217, 217, 1) with:@"图片"];
        _secondTitleBtn = [self buttoninitBtnView:CGRectMake(width_screen/2+30, 0, width_screen/2-40, 60) with:[UIColor whiteColor] with:@"如果你无法简洁的表达你的想法那只说明你还\n  ￥20000 ❤️"];
        
        [self addSubview:_firstTitleBtn];
        [self addSubview:_secondImgBtn];
        [self addSubview:_secondTitleBtn];
        [self addSubview:_firstImgBtn];
        
    }
    return self;
}
-(UIButton *)buttoninitBtnView:(CGRect)frame with:(UIColor *)color with:(NSString *)title{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = color;
    button.titleLabel.numberOfLines = 0;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.titleLabel.adjustsFontSizeToFitWidth =YES;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
