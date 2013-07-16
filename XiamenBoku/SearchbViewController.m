//
//  SearchbViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "SearchbViewController.h"
#import "ModelCreat.h"

@interface SearchbViewController ()

@end

@implementation SearchbViewController

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
    
    self.pointView=[ModelCreat createWithImageview:[UIImage imageNamed:@"point"] andFrame:CGRectMake(50, 80+100, 25, 25)];
    [self.view addSubview:self.pointView];
    
    self.lineView=[ModelCreat createWithImageview:[UIImage imageNamed:@"line"] andFrame:CGRectMake(200, 92.5+100, 767, 2)];
    [self.view addSubview:self.lineView];
    
    self.pointLable=[ModelCreat createWithLable:@"推荐视频"
                                       andFrame:CGRectMake(80, 63+100, 100, 60)
                                  andTitleColor:nil
                                   andTitleSize:20];
    self.pointLable.textAlignment=NSTextAlignmentCenter;
    self.pointLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pointLable];
    
    UIImageView *bokan=[ModelCreat createWithImageview:[UIImage imageNamed:@"bokan"]
                                              andFrame:CGRectMake(1024/2-80, 0, 151, 60)];
    [self.view addSubview:bokan];
    
    
    self.searchLable=[[UISearchBar alloc]initWithFrame:CGRectMake(1024/2-400, 80, 800, 80)];
    self.searchLable.delegate=self;
    self.searchLable.text=@"请输入搜索词";
    [[self.searchLable.subviews objectAtIndex:0]removeFromSuperview];
    [self.view addSubview:self.searchLable];
    
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
