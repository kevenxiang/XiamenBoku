//
//  PlayerView.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "PlayerView.h"
#import "ModelCreat.h"
#import "ViewController.h"
#import <BaiduSocialShare/BDSocialShareSDK.h>


@implementation PlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
        self.playView=[[UIView alloc]init];
        self.playView.frame=CGRectMake(0, 0, 742, 727);
        self.playView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"play_bg"]];
        [self addSubview:self.playView];
        
        NSString *path=[[NSBundle mainBundle] pathForResource:@"个人定向之新鹰的重生" ofType:@"mp4"];
        NSURL *url=[[NSURL alloc]initFileURLWithPath:path];
        self.mpC=[[MPMoviePlayerController alloc]initWithContentURL:url];
        self.mpC.view.frame=CGRectMake(742/2-580/2, 80, 580, 435);
        [self.playView addSubview:self.mpC.view];
        
        self.closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.closeBtn.frame=CGRectMake(680, 20, 40, 40);
        [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [self.closeBtn addTarget:self action:@selector(closeMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.closeBtn];
        
        self.Playbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.Playbtn.frame=CGRectMake(742/2-77/2, 727/2-100, 77, 75);
        [self.Playbtn setBackgroundImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
        [self.Playbtn addTarget:self action:@selector(playMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.Playbtn];
        
        self.collectBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.collectBtn.frame=CGRectMake(742/2-580/2-10, 80+435, 120, 44);
        [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"favor1"] forState:UIControlStateNormal];
        [self.collectBtn addTarget:self action:@selector(collectMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.collectBtn];
        self.collectLab=[[UILabel alloc]init];
        self.collectLab.frame=CGRectMake(40, 0, 80, 44);
        self.collectLab.text=@"收藏";
        self.collectLab.font=[UIFont systemFontOfSize:20];
        self.collectLab.backgroundColor=[UIColor clearColor];
        [self.collectBtn addSubview:self.collectLab];
        
        self.shareBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.shareBtn.frame=CGRectMake(742/2-580/2-10+130, 80+435, 120, 44);
        [self.shareBtn setBackgroundImage:[UIImage imageNamed:@"share1"] forState:UIControlStateNormal];
        [self.shareBtn addTarget:self action:@selector(shareMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.shareBtn];
        self.shareLab=[[UILabel alloc]init];
        self.shareLab.frame=CGRectMake(40, 0, 80, 44);
        self.shareLab.text=@"分享";
        self.shareLab.font=[UIFont systemFontOfSize:20];
        self.shareLab.backgroundColor=[UIColor clearColor];
        [self.shareBtn addSubview:self.shareLab];
        
        self.downBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.downBtn.frame=CGRectMake(742/2-580/2-10+130+130, 80+435, 120, 44);
        [self.downBtn setBackgroundImage:[UIImage imageNamed:@"download1"] forState:UIControlStateNormal];
        [self.downBtn addTarget:self action:@selector(downMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.downBtn];
        self.downLab=[[UILabel alloc]init];
        self.downLab.frame=CGRectMake(40, 0, 80, 44);
        self.downLab.text=@"下载";
        self.downLab.font=[UIFont systemFontOfSize:20];
        self.downLab.backgroundColor=[UIColor clearColor];
        [self.downBtn addSubview:self.downLab];
        
        self.listenBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.listenBtn.frame=CGRectMake(742/2-580/2+530, 80+435-5, 59, 51);
        [self.listenBtn setBackgroundImage:[UIImage imageNamed:@"audio0"] forState:UIControlStateNormal];
        [self.listenBtn addTarget:self action:@selector(listenMV:) forControlEvents:UIControlEventTouchUpInside];
        [self.playView addSubview:self.listenBtn];
        
        self.mainText=[[UITextView alloc]init];
        self.mainText.frame=CGRectMake(742/2-580/2, 80+435+44, 580, 120);
        self.mainText.backgroundColor=[UIColor clearColor];
        self.mainText.font=[UIFont systemFontOfSize:18];
        self.mainText.editable=NO;
        self.mainText.text=@"鹰的重生";
        [self.playView addSubview:self.mainText];
        
        self.titleLab=[[UILabel alloc]init];
        self.titleLab.frame=CGRectMake(742/2-580/2, 30, 580, 40);
        self.titleLab.text=@"鹰的重生";
        self.titleLab.font=[UIFont boldSystemFontOfSize:24];
        self.titleLab.backgroundColor=[UIColor clearColor];
        [self.playView addSubview:self.titleLab];
        
        NSDate *da=[[NSDate alloc]init];
        self.timeLable=[[UILabel alloc]init];
        self.timeLable.frame=CGRectMake(560, 60, 120, 20);
        NSString *time=[NSString stringWithString:[da descriptionWithLocale:nil]];
        self.timeLable.textAlignment=NSTextAlignmentCenter;
        self.timeLable.backgroundColor=[UIColor clearColor];
        self.timeLable.text=time;
        [self.playView addSubview:self.timeLable];
        

        
        // Initialization code
    }
    return self;
}



-(void)closeMV:(UIButton *)sender
{
    [UIView animateWithDuration:1 animations:^{
        self.playView.frame=CGRectMake(100,2048, 742, 727);
        self.frame=CGRectMake(100,2048, 742, 727);
    }];
    
    [self.mpC stop];

}

-(void)playMV:(UIButton *)sender
{
    [self.mpC play];
    [self.Playbtn removeFromSuperview];
}

-(void)collectMV:(UIButton *)sender
{

}

-(void)shareMV:(UIButton *)sender
{
    BDSocialShareContent *content = [BDSocialShareContent shareContentWithDescription:self.mainText.text url:@"http://www.zhizhang.com/more/download.php?appid=19" title:@"百度社会化分享"];
    //    [content addImageWithImageSource:[UIImage imageNamed:@"share_small.png"] imageUrl:@"http://apps.bdimg.com/developer/static/04171450/developer/images/icon/terminal_adapter.png"];
//    [content addImageWithImageSource:self.playView.image imageUrl:@"http://www.zhizhang.com/more/download.php?appid=19"];
    [BDSocialShareSDK showShareMenuWithShareContent:content menuStyle:BD_SOCIAL_SHARE_MENU_THEME_STYLE result:^(SHARE_RESULT requestResult, NSString *shareType, id response, NSError *error) {
        if (requestResult == BD_SOCIAL_SHARE_SUCCESS) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享成功" message:[NSString stringWithFormat:@"%@分享成功",shareType] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            NSLog(@"%@分享成功",shareType);
            
            
            
        } else if (requestResult == BD_SOCIAL_SHARE_CANCEL){
            NSLog(@"分享取消");
        } else if (requestResult == BD_SOCIAL_SHARE_FAIL){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败" message:[NSString stringWithFormat:@"%@分享失败\n error code:%d;\n error message:%@",shareType,error.code,[error localizedDescription]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            NSLog(@"%@分享失败\n error code:%d;\n error message:%@",shareType,error.code,[error localizedDescription]);
        }
    }];

}

-(void)downMV:(UIButton *)sender
{

}

-(void)listenMV:(UIButton *)sender
{

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
