//
//  LinkViewController.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-19.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkViewController : UIViewController<UIWebViewDelegate,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchB;

@property (retain, nonatomic) UIWebView *webV;
@property(retain,nonatomic)UIActivityIndicatorView* activityIndicator;

@end
