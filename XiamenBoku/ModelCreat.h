//
//  ModelCreat.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-11.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelCreat : NSObject

//创建button的方法
+(id)createWithNormalImage:(UIImage *)normal andFrame:(CGRect)buttonFrame andPressedImage:(UIImage *)pressImg andTitle:(NSString *)title andTarget:(id)target andAction:(SEL)selecter andEvent:(UIControlEvents)controlEvent;

//创建uiimageview的方法
+(id)createWithImageview:(UIImage *)img andFrame:(CGRect)viewFrame;

//创建uilable的方法
+(id)createWithLable:(NSString *)title andFrame:(CGRect)frame andTitleColor:(UIColor *)titleColor andTitleSize:(CGFloat)fontSize;

//创建view的方法
+(id)createWithView:(UIImage *)viewImg andFrame:(CGRect)frame andViewWithTag:(int)tag;




@end
