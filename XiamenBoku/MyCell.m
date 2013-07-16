//
//  MyCell.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MyCell.h"
#import "ModelCreat.h"

@implementation MyCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        self.view1=[[UIView alloc]initWithFrame:CGRectMake(26, 0, 230, 200)];
        self.imgV1=[ModelCreat createWithImageview:nil andFrame:CGRectMake(0, 0, 230, 180)];
        self.strLable1=[ModelCreat createWithLable:nil andFrame:CGRectMake(0, 180, 230, 20) andTitleColor:nil andTitleSize:17];
        [self.view1 addSubview:self.strLable1];
        [self.view1 addSubview:self.imgV1];
        [self.contentView addSubview:self.strLable1];
        [self.contentView addSubview:self.imgV1];
        
        self.view2=[[UIView alloc]initWithFrame:CGRectMake(230+26, 0, 230, 200)];
        self.imgV2=[ModelCreat createWithImageview:nil andFrame:CGRectMake(0, 0, 230, 180)];
        self.strLable2=[ModelCreat createWithLable:nil andFrame:CGRectMake(0, 180, 230, 20)  andTitleColor:nil andTitleSize:17];
        [self.view2 addSubview:self.strLable2];
        [self.view2 addSubview:self.imgV2];
        
        self.view3=[[UIView alloc]initWithFrame:CGRectMake(230*2+26, 0, 230, 200)];
        self.imgV3=[ModelCreat createWithImageview:nil andFrame:CGRectMake(0, 0, 230, 180)];
        self.strLable3=[ModelCreat createWithLable:nil andFrame:CGRectMake(0, 180, 230, 20) andTitleColor:nil andTitleSize:17];
        [self.view3 addSubview:self.strLable3];
        [self.view3 addSubview:self.imgV3];
        
        self.view4=[[UIView alloc]initWithFrame:CGRectMake(230*3+26, 0, 230, 200)];
        self.imgV4=[ModelCreat createWithImageview:nil andFrame:CGRectMake(0, 0, 230, 180)];
        self.strLable4=[ModelCreat createWithLable:nil andFrame:CGRectMake(0, 180, 230, 20) andTitleColor:nil andTitleSize:17];
        [self.view4 addSubview:self.strLable4];
        [self.view4 addSubview:self.imgV4];
        
    
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
