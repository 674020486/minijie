//
//  AppDelegate.h
//  QueenBazaar
//
//  Created by 李雪虎 on 2017/12/19.
//  Copyright © 2017年 李雪虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSlideViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
@property (strong, nonatomic) UINavigationController *mainNavigationController;

@end

