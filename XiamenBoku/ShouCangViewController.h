//
//  ShouCangViewController.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShouCangViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(retain,nonatomic)UIButton *retureBtn;

@property(retain,nonatomic)UILabel *centerLable;

@property(retain,nonatomic)UITableView *table;

@property(retain,nonatomic)NSMutableArray *gotDataAry;

@end
