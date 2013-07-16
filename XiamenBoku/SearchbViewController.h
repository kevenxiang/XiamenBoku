//
//  SearchbViewController.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchbViewController : UIViewController<UISearchBarDelegate>

@property(retain,nonatomic)UIButton *retureBtn;

@property(retain,nonatomic)UIImageView *pointView;

@property(retain,nonatomic)UILabel *pointLable;

@property(retain,nonatomic)UIView *lineView;

@property(retain,nonatomic)UISearchBar *searchLable;

@property(assign,nonatomic)UISearchBarIcon *img;



@end
