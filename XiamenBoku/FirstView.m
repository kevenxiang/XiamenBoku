//
//  FirstView.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-13.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "FirstView.h"
#import "ModelCreat.h"
#import <QuartzCore/QuartzCore.h>
#import "PlayerView.h"

@implementation FirstView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
   
        self.view1=[ModelCreat createWithView:nil andFrame:CGRectMake(2, 0, 460, 400) andViewWithTag:200];
        self.imgV1=[ModelCreat createWithImageview:nil
                                          andFrame:CGRectMake(0, 0, 460, 340)];
        self.lable1=[ModelCreat createWithLable:nil                                       andFrame:CGRectMake(0, 340, 460, 50)
                                  andTitleColor:nil
                                   andTitleSize:20];
        self.lable1.backgroundColor=[UIColor whiteColor];
        self.lable1.textAlignment=NSTextAlignmentCenter;
        [self.view1 addSubview:self.imgV1];
        [self.view1 addSubview:self.lable1];
        [self addSubview:self.view1];
       
         self.view2=[ModelCreat createWithView:nil andFrame:CGRectMake(470, 40, 370, 300) andViewWithTag:201];
        self.imgV2=[ModelCreat createWithImageview:nil
                                          andFrame:CGRectMake(0, 0, 370, 250)];
        self.lable2=[ModelCreat createWithLable:nil
                                       andFrame:CGRectMake(0, 250, 370, 40)
                                  andTitleColor:nil
                                   andTitleSize:17];
        self.lable2.backgroundColor=[UIColor whiteColor];
        self.lable2.textAlignment=NSTextAlignmentCenter;
        [self.view2 addSubview:self.imgV2];
        [self.view2 addSubview:self.lable2];
        [self addSubview:self.view2];
        
        //图片点击可播放视频
       self.view3=[ModelCreat createWithView:nil andFrame:CGRectMake(2, 410, 274, 250) andViewWithTag:202];
        self.imgV3=[ModelCreat createWithImageview:nil
                                          andFrame:CGRectMake(0, 0, 274, 200)];
        self.lable3=[ModelCreat createWithLable:nil
                                       andFrame:CGRectMake(0, 200, 274, 30)
                                  andTitleColor:nil
                                   andTitleSize:17];
        self.lable3.backgroundColor=[UIColor whiteColor];
        self.lable3.textAlignment=NSTextAlignmentCenter;
        [self.view3 addSubview:self.imgV3];
        [self.view3 addSubview:self.lable3];
        [self addSubview:self.view3];
                
        
        
        self.view4=[ModelCreat createWithView:nil andFrame:CGRectMake(280, 410, 274, 250) andViewWithTag:203];
        self.imgV4=[ModelCreat createWithImageview:nil
                                          andFrame:CGRectMake(0, 0, 274, 200)];
        self.lable4=[ModelCreat createWithLable:nil
                                       andFrame:CGRectMake(0, 200, 274, 30)
                                  andTitleColor:nil
                                   andTitleSize:17];
        self.lable4.backgroundColor=[UIColor whiteColor];
        self.lable4.textAlignment=NSTextAlignmentCenter;
        [self.view4 addSubview:self.imgV4];
        [self.view4 addSubview:self.lable4];
        [self addSubview:self.view4];

        
        self.view5=[ModelCreat createWithView:nil andFrame:CGRectMake(560, 410, 274, 250) andViewWithTag:204];
        self.imgV5=[ModelCreat createWithImageview:nil
                                          andFrame:CGRectMake(0, 0, 274, 230)];
        [self.view5 addSubview:self.imgV5];
        [self addSubview:self.view5];
        
        for (int i=0; i<9; i++) {
            self.imgV5=[ModelCreat createWithImageview:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]] andFrame:CGRectMake(i%3*80, i/3*80, 274/3, 230/3)];
            [self.view5 addSubview:self.imgV5];
        }
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
