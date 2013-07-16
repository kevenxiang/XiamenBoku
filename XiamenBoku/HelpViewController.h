//
//  HelpViewController.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-15.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController<UIScrollViewDelegate>

@property(retain,nonatomic)UIButton *returnBtn;

@property(retain,nonatomic)UILabel *helpLable;

@property(retain,nonatomic)UIImageView *rightView;
@property(retain,nonatomic)UILabel *rightLable;
@property(retain,nonatomic)UIButton *rightBtn;

@property(retain,nonatomic)UIScrollView *svc;
@property(retain,nonatomic)UIPageControl *myPage;


@property(retain,nonatomic)UIImageView *pointView;

@property(retain,nonatomic)UILabel *pointLable;

@property(retain,nonatomic)UIView *lineView;

@end
