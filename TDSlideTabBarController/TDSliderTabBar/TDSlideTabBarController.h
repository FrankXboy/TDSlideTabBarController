//
//  TDSlideTabBarController.h
//  TDSlideTabBarController
//
//  Created by 谢欣 on 16/6/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDSlideTabBarController : UIViewController

/** 子控制器 */
@property (nonatomic, strong) NSArray *subViewControllers;
/** 容器view的弹簧效果 */
@property (nonatomic, assign) BOOL contentViewBounces;

- (void)addSuperController:(UIViewController *)viewController;
@end
