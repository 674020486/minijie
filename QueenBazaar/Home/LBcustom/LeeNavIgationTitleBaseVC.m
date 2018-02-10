//
//  LeeNavIgationTitleBaseVC.m
//  Kosun
//
//  Created by 刘松坡 on 2017/2/22.
//  Copyright © 2017年 刘松坡. All rights reserved.
//

#import "LeeNavIgationTitleBaseVC.h"

@interface LeeNavIgationTitleBaseVC ()

@end

@implementation LeeNavIgationTitleBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:COLOR(61, 160, 248, 1)];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:20],
    
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self loadNavTitle];
    // Do any additional setup after loading the view.
}
- (void)loadNavTitle{
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, 13, 21);
    [_btn setImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(backButClicled) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:_btn];
    self.navigationItem.leftBarButtonItem = item;
    
    
}
- (void)backButClicled{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
