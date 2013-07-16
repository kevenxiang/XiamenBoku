//
//  HelpViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-15.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "HelpViewController.h"
#import "ModelCreat.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

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

//page和scroll连起来一起动的方法
-(void)changePage:(id)sender
{
    int page=self.myPage.currentPage;
    [self.svc setContentOffset:CGPointMake(800*page, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page=scrollView.contentOffset.x/800;
    self.myPage.currentPage=page;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.png"]];
    self.returnBtn=[ModelCreat createWithNormalImage:[UIImage imageNamed:@"back"]
                                            andFrame:CGRectMake(8, 8, 54, 53)
                                     andPressedImage:[UIImage imageNamed:@"back@2x"]
                                            andTitle:nil
                                           andTarget:self
                                           andAction:@selector(reture:)
                                            andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:self.returnBtn];
    
    self.helpLable=[ModelCreat createWithLable:@"帮助"
                                        andFrame:CGRectMake(1024/2-50, 20, 100, 20)
                                   andTitleColor:nil
                                    andTitleSize:20];
    self.helpLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.helpLable];
    
    self.rightView=[ModelCreat createWithImageview:[UIImage imageNamed:@"feedback_pre"]
                                          andFrame:CGRectMake(800, 10, 173, 40)];
    [self.view addSubview:self.rightView];
    
    self.rightLable=[ModelCreat createWithLable:@"反馈意见" andFrame:CGRectMake(850, 10, 120, 40) andTitleColor:nil andTitleSize:20];
    self.rightLable.backgroundColor=[UIColor clearColor];
    self.rightLable.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.rightLable];
    
    self.rightBtn=[ModelCreat createWithNormalImage:[UIImage imageNamed:@"feedback_pre"] andFrame:CGRectMake(800, 10, 173, 40)
                                    andPressedImage:[UIImage imageNamed:@"feedback_pre@2x"]
                                           andTitle:nil
                                          andTarget:self
                                          andAction:@selector(fankui:)
                                           andEvent:UIControlEventTouchUpInside];
    self.rightBtn.backgroundColor=[UIColor clearColor];
    self.rightBtn.alpha=0.1;
    [self.view addSubview:self.rightBtn];
    
    self.svc=[[UIScrollView alloc]init];
    self.svc.frame=CGRectMake(100, 100, 800, 460);
    self.svc.delegate=self;
    self.svc.pagingEnabled=YES;
    //不显示水平滚动条
    self.svc.showsHorizontalScrollIndicator=NO;
    self.svc.indicatorStyle=UIScrollViewIndicatorStyleWhite;
    self.svc.contentSize=CGSizeMake(800*2, 460);
    [self.view addSubview:self.svc];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 800, 460)];
    view1.backgroundColor=[UIColor redColor];
    [self.svc addSubview:view1];
    
    UIView *view2=[[UIView alloc]initWithFrame:CGRectMake(800, 0, 800, 460)];
    view2.backgroundColor=[UIColor blueColor];
    [self.svc addSubview:view2];
    
    self.myPage=[[UIPageControl alloc]initWithFrame:CGRectMake(350, 600, 50, 4)];
    self.myPage.numberOfPages=2;
    self.myPage.currentPage=0;
 
    self.myPage.pageIndicatorTintColor=[UIColor grayColor];
    self.myPage.currentPageIndicatorTintColor=[UIColor redColor];
    [self.myPage addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.myPage];

    self.pointView=[ModelCreat createWithImageview:[UIImage imageNamed:@"point"] andFrame:CGRectMake(50, 620, 25, 25)];
    [self.view addSubview:self.pointView];
    
    self.lineView=[ModelCreat createWithImageview:[UIImage imageNamed:@"line"] andFrame:CGRectMake(230, 630, 600, 2)];
    [self.view addSubview:self.lineView];
    
    self.pointLable=[ModelCreat createWithLable:@"博看掌上应用中心"
                                       andFrame:CGRectMake(80, 600, 200, 60)
                                  andTitleColor:nil
                                   andTitleSize:20];
    self.pointLable.textAlignment=NSTextAlignmentCenter;
    self.pointLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pointLable];

    for (int i=0; i<8; i++) {
        UIImageView *imgV=[ModelCreat createWithImageview:[UIImage imageNamed:[NSString stringWithFormat:@"1%d.png",i+1]]
                                                andFrame:CGRectMake(i%8*100+100, 650, 84, 82)];
        [self.view addSubview:imgV];
    }
    
	// Do any additional setup after loading the view.
}

-(void)fankui:(UIButton *)sender
{
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
