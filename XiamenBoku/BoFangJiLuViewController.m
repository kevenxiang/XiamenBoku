//
//  BoFangJiLuViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "BoFangJiLuViewController.h"
#import "ModelCreat.h"

@interface BoFangJiLuViewController ()

@end

@implementation BoFangJiLuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

-(void)reture:(UIButton *)sender
{
  [self dismissViewControllerAnimated:YES completion:^{
      NULL;
  }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.png"]];
    self.retureBtn=[ModelCreat createWithNormalImage:[UIImage imageNamed:@"back"]
                                            andFrame:CGRectMake(8, 8, 54, 53)
                                     andPressedImage:[UIImage imageNamed:@"back@2x"]
                                            andTitle:nil
                                           andTarget:self
                                           andAction:@selector(reture:)
                                            andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:self.retureBtn];
    
    self.centerLable=[ModelCreat createWithLable:@"播放记录"
                                        andFrame:CGRectMake(1024/2-50, 20, 100, 20)
                                   andTitleColor:nil
                                    andTitleSize:20];
    self.centerLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.centerLable];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
