//
//  TDSlideTabBarController.m
//  TDSlideTabBarController
//
//  Created by 谢欣 on 16/6/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import "TDSlideTabBarController.h"
#import "Common.h"

@interface TDSlideTabBarController () <UIScrollViewDelegate>
{
    UIScrollView *_contentView; //容器view
    NSMutableArray *_titles; //存放子控制器的数组
    NSInteger _currentIndex; //当前所显示view的索引
    
}

@end

@implementation TDSlideTabBarController

#pragma mark -------------------
#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildVc];
    [self setUpChildView];
}

- (void)setSubViewControllers:(NSArray *)subViewControllers {
    _subViewControllers = subViewControllers;
}

#pragma mark -------------------
#pragma mark 公共方法
/**
 *  要将父控制器传递进来？？
 */
- (void)addSuperController:(UIViewController *)viewController
{
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
}

#pragma mark -------------------
#pragma mark 私有方法
/**
 *  初始化控制器
 */
- (void)setUpChildVc
{
    //初始化值
    _currentIndex = 1;
    
    //添加子控制器
    _titles = [[NSMutableArray alloc] initWithCapacity:_subViewControllers.count];
    for (UIViewController *childVc in _subViewControllers) {
        [_titles addObject:childVc.view];
    }
}

/**
 *  添加子界面显示
 */
- (void)setUpChildView {
    [self setUpShowView];
    
    //遍历添加子控制器界面
    [_subViewControllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *childVc = _subViewControllers[idx];
        childVc.view.frame = CGRectMake(_contentView.td_width * idx, DOT_COORDINATE, _contentView.td_width, _contentView.td_height);
        [_contentView addSubview:childVc.view];
        [self addChildViewController:childVc];
    }];
}

/**
 *  初始化显示界面
 */
- (void)setUpShowView
{
    //设置容器contentView
    _contentView = [[UIScrollView alloc] init];
    _contentView.backgroundColor = [UIColor lightGrayColor];
    _contentView.frame = self.view.bounds;
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.showsVerticalScrollIndicator = NO;
    _contentView.pagingEnabled = YES;
    _contentView.scrollsToTop = NO;
    _contentView.bounces = _contentViewBounces;
    _contentView.delegate = self;
    _contentView.contentSize = CGSizeMake(self.view.td_width * _subViewControllers.count, DOT_COORDINATE);
    [self.view addSubview:_contentView];
    
    //标题栏view
    UIView *titlesView = [[UIView alloc] initWithFrame:CGRectMake(DOT_COORDINATE, NavBarH, self.view.td_width, TitlesViewH)];
    titlesView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:titlesView];
    
}


#pragma mark -------------------
#pragma mark 代理方法

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //滑动scrollView改变索引
    _currentIndex = scrollView.contentOffset.x / scrollView.td_width;
//    NSLog(@"%ld", _currentIndex);
}

@end
