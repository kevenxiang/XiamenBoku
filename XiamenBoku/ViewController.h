//
//  ViewController.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-10.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerView.h"
#import "MoreView.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property(retain,nonatomic)UIScrollView *sc;

//创建左边显示各个按钮的view
@property(retain,nonatomic)UIView *leftView;
@property(retain,nonatomic)UIButton *leftBtn;
@property(retain,nonatomic)UIPageControl *myPage;
@property(retain,nonatomic)UISwipeGestureRecognizer *right,*left;
@property(retain,nonatomic)UIView *eightview;
//博看家园，精英师资，就业明星，联系我们，厦门博看介绍，项目实训，校企合作，研发中心
@property(retain,nonatomic)NSMutableArray *titleAry;
@property(retain,nonatomic)UITapGestureRecognizer *tap;
@property(retain,nonatomic)UIButton *eightBtn;

@property(retain,nonatomic)UIView *LeftMenuView;

@property(assign,nonatomic)int alph;

@property(retain,nonatomic)PlayerView *pla;
@property(retain,nonatomic)MoreView *more;

@property(retain,nonatomic)UIScrollView *xiaoSc;

@property(assign,nonatomic)int autochange;

@property(retain,nonatomic)NSMutableArray *detailAry;



@end
