//
//  PlayerView.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface PlayerView : UIView


@property(retain,nonatomic)UIView *playView;
@property(retain,nonatomic)MPMoviePlayerController *mpC;
@property(retain,nonatomic)UIButton *closeBtn;
@property(retain,nonatomic)UIButton *Playbtn;
@property(retain,nonatomic)UIButton *collectBtn;

@property(retain,nonatomic)UILabel *collectLab;
@property(retain,nonatomic)UIButton *shareBtn;
@property(retain,nonatomic)UILabel *shareLab;
@property(retain,nonatomic)UIButton *downBtn;
@property(retain,nonatomic)UILabel *downLab;
@property(retain,nonatomic)UITextView *mainText;
@property(retain,nonatomic)UILabel *timeLable;
@property(retain,nonatomic)UILabel *titleLab;


@property(retain,nonatomic)UIImageView *shouImg;
@property(retain,nonatomic)UILabel *shouLable;
@property(retain,nonatomic)UIButton *shouBtn;

@property(retain,nonatomic)UIImageView *fenImg;
@property(retain,nonatomic)UILabel *fenLable;
@property(retain,nonatomic)UIButton *fenBtn;

@property(retain,nonatomic)UIImageView *xiaImg;
@property(retain,nonatomic)UILabel *xiaLable;
@property(retain,nonatomic)UIButton *xiaBtn;

@property(retain,nonatomic)UIButton *listenBtn;

@property(retain,nonatomic)UITextField *detailLable;


@end
