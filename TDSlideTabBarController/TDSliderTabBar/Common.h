//
//  Common.h
//  TDSlideTabBarController
//
//  Created by 谢欣 on 16/6/3.
//  Copyright © 2016年 Frank. All rights reserved.
//

#ifndef Common_h
#define Common_h


#import "UIView+TDFrame.h"

#define NavBarH 64
#define TabBarH 49
#define TitlesViewH 35
#define DOT_COORDINATE 0.0f   //坐标原点

// RGB色
#define TDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define TDRandomColor TDColor(arc4random_uniform(256), arc4random_uniform(256),arc4random_uniform(256))

#endif /* Common_h */
