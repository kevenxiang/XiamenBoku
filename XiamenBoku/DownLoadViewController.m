//
//  FiveViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "DownLoadViewController.h"
#import "ModelCreat.h"

@interface DownLoadViewController ()

@end

@implementation DownLoadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    

    self.centerLable=[ModelCreat createWithLable:@"离线下载"
                                        andFrame:CGRectMake(1024/2-50, 20, 100, 20)
                                   andTitleColor:nil
                                    andTitleSize:20];
    self.centerLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.centerLable];
    
    self.pointView=[ModelCreat createWithImageview:[UIImage imageNamed:@"point"] andFrame:CGRectMake(50, 80, 25, 25)];
    [self.view addSubview:self.pointView];
    
    self.lineView=[ModelCreat createWithImageview:[UIImage imageNamed:@"line"] andFrame:CGRectMake(200, 92.5, 767, 2)];
    [self.view addSubview:self.lineView];
    
    self.pointLable=[ModelCreat createWithLable:@"知识讲堂"
                                       andFrame:CGRectMake(80, 63, 100, 60)
                                  andTitleColor:nil
                                   andTitleSize:20];
    self.pointLable.textAlignment=NSTextAlignmentCenter;
    self.pointLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pointLable];
    
    
    
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
