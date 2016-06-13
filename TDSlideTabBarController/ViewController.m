//
//  ViewController.m
//  TDSlideTabBarController
//
//  Created by 谢欣 on 16/6/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "ViewController.h"
#import "TDSlideTabBarController.h"
#import "Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //1
    UIViewController *oneVc = [[UIViewController alloc] init];
    oneVc.view.backgroundColor = TDRandomColor;
    
    //2
    UITableViewController *twoVc = [[UITableViewController alloc] init];
    twoVc.view.backgroundColor = TDRandomColor;
    
    //3
    UIViewController *ThreeVc = [[UIViewController alloc] init];
    ThreeVc.view.backgroundColor = TDRandomColor;
    
    //4
    UITableViewController *fourVc = [[UITableViewController alloc] init];
    fourVc.view.backgroundColor = TDRandomColor;
    
    //创建TDSlideTabBarController
    TDSlideTabBarController *slideVc = [[TDSlideTabBarController alloc] init];
    slideVc.subViewControllers = @[oneVc, twoVc, ThreeVc, fourVc];
//    slideVc.contentViewBounces = NO;
    
    [slideVc addSuperController:self];
    
}



@end
