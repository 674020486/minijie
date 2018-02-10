//
//  MainPageViewController.m
//  LeftSlide
//
//  Created by huangzhenyu on 15/6/18.
//  Copyright (c) 2015年 eamon. All rights reserved.
//

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "CarouseView.h"
#import "CarouseViewPlus.h"
#import "uitaTableViewCell.h"//风格
#import "HomeClassificationTableViewCell.h"//风格
#import "HomeThemeTableViewCell.h"//主题
#import "HomeQueenStyleTableViewCell.h"//样式
#import "HomeRecommendTableViewCell.h"//推荐
#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名
@interface MainPageViewController ()<CarouseViewDataSource, CarouseViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    // 轮播图变量，其实作为局部变量也行
    CarouseView *carouseView;
    CarouseViewPlus *carouseViewPlus;
    
    // 轮播图相关的数据
    NSArray *kvDataArray;
}
@property (nonatomic , strong) UITableView *tableview;
@property (nonatomic , strong)UIView *BigView;
@property (nonatomic , strong)NSArray *titleArr;
@property(nonatomic ,assign)BOOL btnBool;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"芭莎女王";
    self.view.backgroundColor = [UIColor whiteColor];
    //导航左按钮
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    //导航右按钮
    UIButton *SmenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    SmenuBtn.frame = CGRectMake(0, 0, 20, 18);
    [SmenuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [SmenuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:SmenuBtn];
    
    _titleArr = @[@"风格分类",@"主题分类",@"女王样式",@"单包推荐"];
    [self addTabelView];//添加表
     [self navBtnView];//添加导航按钮
   
}
//悬浮导航按钮
-(void)navBtnView{
    
    
    for (int a=0; a<4; a++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, height_screen-80, 60, 60);
        button.backgroundColor = [UIColor grayColor];
        button.layer.masksToBounds=YES;
        [button.layer setCornerRadius:30.0];
        button.tag =1100+a;
        button.alpha=0;
        if (a==3) {
            button.alpha=1;
        }
        [button addTarget:self action:@selector(buttonClciked:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[NSString stringWithFormat:@"%d",a] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [self.view bringSubviewToFront:button];
    }
   
    
}
//添加表
-(void)addTabelView{
    _BigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, 200)];
    _BigView.backgroundColor = [UIColor whiteColor];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen)];
    _tableview.tableHeaderView = _BigView;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    //风格
    [_tableview registerNib:[UINib nibWithNibName:@"uitaTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellTow"];
    [_tableview registerClass:[HomeClassificationTableViewCell class] forCellReuseIdentifier:@"ClassificationCell"];
    
    //主题
    [_tableview registerClass:[HomeThemeTableViewCell class] forCellReuseIdentifier:@"themeCell"];
    //样式
    [_tableview registerClass:[HomeQueenStyleTableViewCell class] forCellReuseIdentifier:@"QueenStyle"];
    //推荐
     [_tableview registerClass:[HomeRecommendTableViewCell class] forCellReuseIdentifier:@"Recommend"];
    [self addLunBoView];
    
}

//添加轮播图
-(void)addLunBoView{
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    carouseViewPlus = [[CarouseViewPlus alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self setupCarouseViewPlus];
    [_BigView addSubview:carouseViewPlus];
}


#pragma mark - 表代理
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 180;
    }else if (indexPath.section==1){
        return 150;
    }else if (indexPath.section==2){
        return 220;
    }
    return 200;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 250, 30)];
    label.text = _titleArr[section];
    [view addSubview:label];
    
    return view;
}
//返回cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==3) {
        return 4;
    }else{
    return 1;
    }
}
//返回区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        HomeClassificationTableViewCell *classificationCell = [tableView dequeueReusableCellWithIdentifier:@"ClassificationCell"];
        return classificationCell;
    }else if (indexPath.section==1){
        HomeThemeTableViewCell *themeCell =[tableView dequeueReusableCellWithIdentifier:@"themeCell"];
        return themeCell;
    }else if (indexPath.section==2){
        HomeQueenStyleTableViewCell *QueenStyleCell =[tableView dequeueReusableCellWithIdentifier:@"QueenStyle"];
        return QueenStyleCell;
    }else if (indexPath.section==3){
        HomeRecommendTableViewCell *RecommendCell =[tableView dequeueReusableCellWithIdentifier:@"Recommend"];
        return RecommendCell;
    }
    
    
    uitaTableViewCell *cellTow = [tableView dequeueReusableCellWithIdentifier:@"cellTow"];
    cellTow.selectionStyle=UITableViewCellSelectionStyleNone;//取消点击状态
    return cellTow;
}


#pragma mark - 轮播图代理
- (NSInteger)countOfCellForCarouseView:(CarouseView *)carouseView
{
    return kvDataArray.count;
}
//轮播图图片
- (UIView *)carouselView:(CarouseView *)carouselView cellAtIndex:(NSInteger)index
{
    // 填充view，可以是任意view
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", (long)index + 1]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    label.textColor = [UIColor redColor];
    label.text = kvDataArray[index];
    [imageView addSubview:label];
    return imageView;
}

#pragma mark - 轮播图2设置
- (void)setupCarouseViewPlus
{
    // 图片数组，可以是其他的资源，设置到轮播图上就可以
    NSMutableArray *imagerray = [NSMutableArray array];
    for (int i = 0; i < kvDataArray.count; i++)
    {
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:@"http://img.taopic.com/uploads/allimg/121019/234917-121019231h258.jpg"]];
//        UIImage *image = [UIImage imageWithData:data]; // 取得图片
        
        // 先用空白页测试
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 1]];
        [imagerray addObject:image];
        NSLog(@"%@",image);
    }
    
    [carouseViewPlus setupSubviewPages:imagerray withCallbackBlock:^(NSInteger pageIndex) {
        // 点击页面
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"carouse2 msg"
                                                            message:kvDataArray[pageIndex]
                                                           delegate:nil
                                                  cancelButtonTitle:@"ok"
                                                  otherButtonTitles:nil, nil];
        [alertView show];
    }];
}
#pragma mark --导航弹出动画
-(void)buttonClciked:(UIButton *)button{
    if (button.tag==1103) {
        if (_btnBool==0) {
            [self yidong];
            _btnBool=!_btnBool;
        }else{
            [self fyidong];
            _btnBool=!_btnBool;
        }
        
    }
}
-(void)yidong{
    UIButton *btn1 =[self.view viewWithTag:1100];
    UIButton *btn2 =[self.view viewWithTag:1101];
    UIButton *btn3 =[self.view viewWithTag:1102];
    NSLog(@"%@",btn1);
    [UIView animateWithDuration:0.5 animations:^{
        btn1.frame = CGRectMake(20, height_screen-180, 60, 60);
        btn2.frame = CGRectMake(80, height_screen-140, 60, 60);
        btn3.frame = CGRectMake(120, height_screen-80, 60, 60);
        btn1.alpha=1;
        btn2.alpha=1;
        btn3.alpha=1;
        
    } completion:^(BOOL finished) {
        
    }];
}
-(void)fyidong{
    UIButton *btn1 =[self.view viewWithTag:1100];
    UIButton *btn2 =[self.view viewWithTag:1101];
    UIButton *btn3 =[self.view viewWithTag:1102];
    [UIView animateWithDuration:0.5 animations:^{
        btn1.frame = CGRectMake(20, height_screen-80, 60, 60);
        btn2.frame = CGRectMake(20, height_screen-80, 60, 60);
        btn3.frame = CGRectMake(20, height_screen-80, 60, 60);
        btn1.alpha=0;
        btn2.alpha=0;
        btn3.alpha=0;
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark -- 翻转动画
- (void)setAnimatedWithTransition{
    /*Fade = 1,                   //淡入淡出
     Push,                       //推挤
     Reveal,                     //揭开
     MoveIn,                     //覆盖
     Cube,                       //立方体
     SuckEffect,                 //吮吸
     OglFlip,                    //翻转
     RippleEffect,               //波纹
     PageCurl,                   //翻页
     PageUnCurl,                 //反翻页
     CameraIrisHollowOpen,       //开镜头
     CameraIrisHollowClose,      //关镜头
     CurlDown,                   //下翻页
     CurlUp,                     //上翻页
     FlipFromLeft,               //左翻转*/
    
    CATransition *animation = [CATransition animation];
    //动画时间
    animation.duration = 1.0f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //过渡效果
//    animation.type = @"pageCurl";
    animation.type = @"curlUp";
    //过渡方向
    animation.subtype = kCATransitionFromRight;
    [self.view.layer addAnimation:animation forKey:nil];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}
#pragma mark -- 抽屉效果代理方法
- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

@end
