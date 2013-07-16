//
//  MoreView.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MoreView.h"
#import "ModelCreat.h"

@implementation MoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
        self.moreView=[[UIView alloc]init];
        self.moreView.frame=CGRectMake(0, 0, 747, 727);
        self.moreView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"play_bg"]];
        [self addSubview:self.moreView];
        
        self.imgV1=[ModelCreat createWithImageview:[UIImage imageNamed:@"57"] andFrame:CGRectMake(0, 10, 340, 700)];
       self.imgV2=[ModelCreat createWithImageview:[UIImage imageNamed:@"55"] andFrame:CGRectMake(347, 10, 340, 700)];
        [self.moreView addSubview:self.imgV1];
        [self.moreView addSubview:self.imgV2];
        
        self.closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.closeBtn.frame=CGRectMake(690, 20, 40, 40);
        [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [self.closeBtn addTarget:self action:@selector(closeMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.moreView addSubview:self.closeBtn];

        
    }
    return self;
}

-(void)closeMV:(UIButton *)sender
{
    [UIView animateWithDuration:1 animations:^{
        self.moreView.frame=CGRectMake(100,2048, 742, 727);
        self.frame=CGRectMake(100,2048, 742, 727);
    }];
       
    
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
