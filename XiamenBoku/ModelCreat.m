//
//  ModelCreat.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-11.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ModelCreat.h"


@implementation ModelCreat

+(id)createWithNormalImage:(UIImage *)normal andFrame:(CGRect)buttonFrame andPressedImage:(UIImage *)pressImg andTitle:(NSString *)title andTarget:(id)target andAction:(SEL)selecter andEvent:(UIControlEvents)controlEvent
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=buttonFrame;
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    [btn setBackgroundImage:pressImg forState:UIControlEventTouchUpInside];
     btn.titleLabel.text=title;
    [btn addTarget:target action:selecter forControlEvents:controlEvent];
    return btn;
    
}

+(id)createWithImageview:(UIImage *)img andFrame:(CGRect)viewFrame
{
    UIImageView *imgView=[[UIImageView alloc]initWithImage:img];
    imgView.frame=viewFrame;
    return imgView;
}

+(id)createWithLable:(NSString *)title andFrame:(CGRect)frame andTitleColor:(UIColor *)titleColor andTitleSize:(CGFloat)fontSize
{
    UILabel *lable=[[UILabel alloc]init];
    lable.text=title;
    lable.frame=frame;
    lable.textColor=titleColor;
    [lable setFont:[UIFont  systemFontOfSize:fontSize]];
    return lable;
}

+(id)createWithView:(UIImage *)viewImg andFrame:(CGRect)frame andViewWithTag:(int)tag
{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor colorWithPatternImage:viewImg];
    view.frame=frame;
    view.tag = tag;
    view.userInteractionEnabled = YES;
    return view;
}



@end
