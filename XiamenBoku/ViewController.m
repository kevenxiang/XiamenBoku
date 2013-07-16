//
//  ViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-10.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ViewController.h"
#import "ModelCreat.h"
#import <QuartzCore/QuartzCore.h>
#import "Hong.h"
#import "FirstView.h"
#import "DownLoadViewController.h"
#import "BoFangJiLuViewController.h"
#import "ShouCangViewController.h"
#import "SearchbViewController.h"
#import "PlayerView.h"
#import "HelpViewController.h"



@interface ViewController ()

@end

@implementation ViewController


-(void)player:(UITapGestureRecognizer *)sender
{
    
    [UIView animateWithDuration:1 animations:^{
            self.pla.frame=CGRectMake(100, 50, 742, 727);
            self.pla.playView.frame=CGRectMake(0, 0, 742, 727);
        }];
    
          }

-(void)moreView:(UITapGestureRecognizer *)sender
{
    NSLog(@"点击");

    [UIView animateWithDuration:1 animations:^{
        self.more.frame=CGRectMake(100, 50, 747, 727);
    }];
}

//page和scroll连起来一起动的方法
-(void)changePage:(id)sender
{
    int page=self.myPage.currentPage;
    [self.sc setContentOffset:CGPointMake(1024*page, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page=scrollView.contentOffset.x/1024;
    self.myPage.currentPage=page;
}

//左侧菜单视图8个选项点击手势事件
-(void)touch:(UITapGestureRecognizer*)sender
{
  
    [UIView animateWithDuration:0.5 animations:^{
        self.leftView.frame=CGRectMake(-200, 748/2-250, 200, 500);
        self.sc.frame=CGRectMake(0, 0, 1024, 748);
        self.leftBtn.frame=CGRectMake(0, 748/2-25, 50, 80);
    }];
    
    [UIView animateWithDuration:0.7 animations:^{
        switch (sender.view.tag) {
            case 1000:
                self.sc.contentOffset=CGPointMake(1024*0, 0);
                break;
            case 1001:
                self.sc.contentOffset=CGPointMake(1024*1, 0);
                break;
            case 1002:
                self.sc.contentOffset=CGPointMake(1024*2, 0);
                break;
            case 1003:
                self.sc.contentOffset=CGPointMake(1024*3, 0);
                break;
            case 1004:
                self.sc.contentOffset=CGPointMake(1024*4, 0);
                break;
            case 1005:
                self.sc.contentOffset=CGPointMake(1024*5, 0);
                break;
            case 1006:
                self.sc.contentOffset=CGPointMake(1024*6, 0);
                break;
            case 1007:
                self.sc.contentOffset=CGPointMake(1024*7, 0);
                break;
            default:
                break;
        }

    }];
    }



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
     self.sc=[[UIScrollView alloc]init];
     self.sc.frame=CGRectMake(0, 0, 1024, 748);
     self.sc.delegate=self;
     self.sc.pagingEnabled=YES;
     //不显示水平滚动条
     self.sc.showsHorizontalScrollIndicator=NO;
     self.sc.indicatorStyle=UIScrollViewIndicatorStyleWhite;
     self.sc.contentSize=CGSizeMake(1024*8, 748);
     [self.view addSubview:self.sc];
    
    //左边view拖出的手势
    self.sc.scrollEnabled=NO;
    self.right=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(moveRight:)];
    [self.right setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.sc addGestureRecognizer:self.right];
    self.left=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(moveLeft:)];
    [self.left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.sc addGestureRecognizer:self.left];
    


    int pageCount=8;
    self.myPage=[[UIPageControl alloc]initWithFrame:CGRectMake(350, 720, 50, 4)];
    self.myPage.numberOfPages=pageCount;
    self.myPage.currentPage=0;
    self.myPage.pageIndicatorTintColor=[UIColor grayColor];
    self.myPage.currentPageIndicatorTintColor=[UIColor redColor];
    [self.myPage addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.myPage];
    
    //创建8个view
    for (int i=1; i<9; i++) {
        UIView *view=[[UIView alloc]init];
        view.frame=CGRectMake(0, 0, 1024*i, 748);
        view.tag=100+i;
        [self.sc addSubview:view];
    }
    //===============================第一页============================================
    
    //第一页
    UIView *view1=[ModelCreat createWithView:nil
                                    andFrame:CGRectMake(0, 0, 1024, 748)
                              andViewWithTag:101];
    view1.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
     [self.sc addSubview:view1];
    UIView *v1=[ModelCreat createWithView:nil andFrame:CGRectMake(50, 62, 880, 670) andViewWithTag:101];
    v1.userInteractionEnabled=YES;

      
    //博看家园
    UIView *bo=[ModelCreat createWithView:[UIImage imageNamed:@"snav1"]
                                 andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                           andViewWithTag:nil];
    UILabel *bol=[ModelCreat createWithLable:@"博看家园" andFrame:CGRectMake(LABLE_X, LABLE_Y, LABLE_WIDTH, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    bol.backgroundColor=[UIColor clearColor];
    
    [v1 addSubview:bol];
    [v1 addSubview:bo];
    [view1 addSubview:v1];
    
    FirstView *v11=[[FirstView alloc]initWithFrame:CGRectMake(2, 0, 460, 400)];
    v11.imgV1.image=[UIImage imageNamed:@"home1"];
    v11.lable1.text=@"家庭大合照";
    v11.imgV2.image=[UIImage imageNamed:@"大鹏来的第一天.JPG"];
    v11.lable2.text=@"大鹏来的第一天";
    v11.lable3.text=@"个人定向之新鹰的重生";
    v11.imgV4.image=[UIImage imageNamed:@"王校之“演讲技巧” (2).JPG"];
    v11.lable4.text=@"王校之“演讲技巧”";
    v11.imgV5.image=[UIImage imageNamed:@"more"];
    [v1 addSubview:v11];
    v11.view3.userInteractionEnabled=YES;
    UIView *view33=[[UIView alloc]initWithFrame:CGRectMake(2, 410, 274, 250)];
    UIImageView *imgV3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 274, 200)];
    imgV3.image=[UIImage imageNamed:@"鹰.png"];
    [view33 addSubview:imgV3];
    [v1 addSubview:view33];
    
    v11.imgV3.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(player:)];
    NSLog(@"-------%@",NSStringFromCGRect(v11.view3.frame));
    [view33 addGestureRecognizer:tap];
    
    
    
    //===============================第二页=============================================
       //第二页
    UIView *view2=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024, 0, 1024, 748)
                              andViewWithTag:102];
    UIView *v2=[ModelCreat createWithView:nil andFrame:CGRectMake(50, 62, 880, 670) andViewWithTag:102];
    [view2 addSubview:v2];
    [self.sc addSubview:view2];
    
    //精英师资
    UIView *shizi=[ModelCreat createWithView:[UIImage imageNamed:@"snav2"]
                                 andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                           andViewWithTag:nil];
    UILabel *si=[ModelCreat createWithLable:@"精英师资" andFrame:CGRectMake(LABLE_X, LABLE_Y, LABLE_WIDTH, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    si.backgroundColor=[UIColor clearColor];
    [v2 addSubview:shizi];
    [v2 addSubview:si];
    
    FirstView *v22=[[FirstView alloc]init];
    v22.imgV1.image=[UIImage imageNamed:@"wang.png"];
    v22.lable1.text=@"王冬强 教学研发总监";
    v22.imgV2.image=[UIImage imageNamed:@"cui.png"];
    v22.lable2.text=@"崔鹏 iOS高级讲师";
    v22.imgV3.image=[UIImage imageNamed:@"guan.png"];
    v22.lable3.text=@"关颂 iOS高级讲师";
    v22.imgV4.image=[UIImage imageNamed:@"li.png"];
    v22.lable4.text=@"李金轩 iOS高级讲师";
    [v2 addSubview:v22];
    
    UIView *view22=[[UIView alloc]initWithFrame:CGRectMake(560, 410, 274, 250)];
    UIImageView *imgV22=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 274, 250)];
//    imgV22.backgroundColor=[UIColor redColor];
    imgV22.image=[UIImage imageNamed:@"51.png"];
    [view22 addSubview:imgV22];
    [v2 addSubview:view22];
    imgV22.userInteractionEnabled=YES;
    
    self.more=[[MoreView alloc]initWithFrame:CGRectMake(100, 1024*2, 742, 727)];
    [self.view addSubview:self.more];
    
    UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moreView:)];
    [view22 addGestureRecognizer:tap1];
    
    //=====================================第三页=========================================
    //第三页
    UIView *view3=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024*2, 0, 1024, 748)
                              andViewWithTag:103];
    [self.sc addSubview:view3];
    UIView *v3=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 880, 670)];
    [view3 addSubview:v3];
    
    //就业明星
    UIView *jiuye=[ModelCreat createWithView:[UIImage imageNamed:@"snav3"]
                                    andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                              andViewWithTag:nil];
     UILabel *jiu=[ModelCreat createWithLable:@"就业明星" andFrame:CGRectMake(LABLE_X, LABLE_Y, LABLE_WIDTH, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    jiu.backgroundColor=[UIColor clearColor];
    [v3 addSubview:jiuye];
    [v3 addSubview:jiu];
    
    FirstView *v33=[[FirstView alloc]init];
    v33.imgV1.image=[UIImage imageNamed:@"启智——前台照.JPG"];
    v33.lable1.text=@"启智——前台照";
    v33.imgV2.image=[UIImage imageNamed:@"ddd"];
    v33.imgV3.image=[UIImage imageNamed:@"eee"];
    v33.imgV4.image=[UIImage imageNamed:@"fff"];
    v33.imgV5.image=[UIImage imageNamed:@"more"];
    [v3 addSubview:v33];
    
    //=====================================第四页========================================
    //第四页
    UIView *view4=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                                  andFrame:CGRectMake(1024*3, 0, 1024, 748)
                                            andViewWithTag:104];
    [self.sc addSubview:view4];
    UIView *v4=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 880, 670)];
    [view4 addSubview:v4];
    //联系我们
    UIView *lianxi=[ModelCreat createWithView:[UIImage imageNamed:@"snav4"]
                                    andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                              andViewWithTag:nil];
    UILabel *lian=[ModelCreat createWithLable:@"联系我们" andFrame:CGRectMake(LABLE_X, LABLE_Y, LABLE_WIDTH, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    lian.backgroundColor=[UIColor clearColor];
    [v4 addSubview:lianxi];
    [v4 addSubview:lian];
    v4.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"lianxi.png"]];

    //====================================第五页=========================================
    //第五页
    UIView *view5=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024*4, 0, 1024, 748)
                              andViewWithTag:105];
    [self.sc addSubview:view5];
    UIView *v5=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 760, 650)];
    [view5 addSubview:v5];
    //厦门博看介绍
    UIView *jieshao=[ModelCreat createWithView:[UIImage imageNamed:@"snav5"]
                                      andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                                andViewWithTag:nil];
    UILabel *jie=[ModelCreat createWithLable:@"学院介绍" andFrame:CGRectMake(LABLE_X, LABLE_Y, 200, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    jie.backgroundColor=[UIColor clearColor];
    [v5 addSubview:jieshao];
    [v5 addSubview:jie];
    v5.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"jieshao.png"]];
    

    //===================================第六页==========================================
    //第六页
    UIView *view6=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024*5, 0, 1024, 748)
                              andViewWithTag:106];
    [self.sc addSubview:view6];
    UIView *v6=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 880, 670)];
    [view6 addSubview:v6];
    
    //项目实训
    UIView *xiangmu=[ModelCreat createWithView:[UIImage imageNamed:@"snav6"]
                                      andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                                andViewWithTag:nil];
    UILabel *mu=[ModelCreat createWithLable:@"项目介绍" andFrame:CGRectMake(LABLE_X, LABLE_Y, 200, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    mu.backgroundColor=[UIColor clearColor];
    [v6 addSubview:xiangmu];
    [v6 addSubview:mu];
    
    //==========================================第七页========================================
    //第七页
    UIView *view7=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024*6, 0, 1024, 748)
                              andViewWithTag:103];
    [self.sc addSubview:view7];
    UIView *v7=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 880, 670)];
    [view7 addSubview:v7];
    
    //校企合作
    UIView *xiaoqi=[ModelCreat createWithView:[UIImage imageNamed:@"snav7"]
                                      andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                                andViewWithTag:nil];
    UILabel *xiao=[ModelCreat createWithLable:@"校企合作" andFrame:CGRectMake(LABLE_X, LABLE_Y, 200, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    xiao.backgroundColor=[UIColor clearColor];
    [v7 addSubview:xiaoqi];
    [v7 addSubview:xiao];
    
    self.autochange=0;
    self.xiaoSc=[[UIScrollView alloc]init];
    self.xiaoSc.frame=CGRectMake(1024*6+250, 150, 500, 800);
    self.xiaoSc.contentSize=CGSizeMake(500*8, 300);
    [self.sc addSubview:self.xiaoSc];
    
    self.detailAry=[[NSMutableArray alloc]initWithObjects:@"面试完毕的第二天大家坐在一起分享这个面试的经历，每个组进行了讨论，总结出了本次网即通面试主要考察得重点，一起分析这次面试自己存在不足的地方，如何改进，为下次面试做好准备。很快，我们收到网即通公司的喜讯：林建裕和严振洋这两位学员被录用了。这是一个良好的开端，其他的学员们也在努力加油中！都在为自己能够赢得一个美好未来做充分的准备！go！go！！go！！",@"巧云妹子在做项目演示",@"网即通人事经理给同学们做公司情况的介绍",@"由于这是博看厦门二班的第一个项目解说会，学员们在项目开发方面必然存在着一些技术问题以及演说表达问题，吴经理也提到学员们是存在一些不足的，但都是一些小问题，具体的他会形成一份文稿，在本周三反馈给博看文思。尽管吴经理对大家的评价很不错，但是在项目经理崔鹏老师的眼里，大家做得还不够好，应该可以做得更好，还有一定的进步空间。",@"网即通的技术总监：来点技术性的问题",@"写写更健康！！",@"有没有崩溃的赶脚！！",@"吴经理做最后总结！！", nil];
    
    for (int i=0; i<8; i++) {
        UIImageView *imgV=[ModelCreat createWithImageview:[UIImage imageNamed:[NSString stringWithFormat:@"2%d.png",i+2]]
                                                 andFrame:CGRectMake(i%8*500, 0, 500, 300)];
        [self.xiaoSc addSubview:imgV];
        
        UITextView *te=[[UITextView alloc]initWithFrame:CGRectMake(i%8*500, 320, 500, 200)];
        te.text=self.detailAry[i];
        te.backgroundColor=[UIColor clearColor];
        te.font=[UIFont boldSystemFontOfSize:20];
        te.textAlignment=NSTextAlignmentCenter;
        [self.xiaoSc addSubview:te];
        
    }

    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(moveDefault:) userInfo:nil repeats:YES];
    
    //========================================第八页=======================================
    //第八页
    UIView *view8=[ModelCreat createWithView:[UIImage imageNamed:@"bg1"]
                                    andFrame:CGRectMake(1024*7, 0, 1024, 748)
                              andViewWithTag:103];
    [self.sc addSubview:view8];
    UIView *v8=[ModelCreat createWithImageview:nil
                                      andFrame:CGRectMake(50, 62, 880, 670)];
    [view8 addSubview:v8];
    
    //研发中心
    UIView *yanfa=[ModelCreat createWithView:[UIImage imageNamed:@"snav8"]
                                     andFrame:CGRectMake(VIEW_X, VIEW_Y, VIEW_WIDTH, VIEW_HEIGHT)
                               andViewWithTag:nil];
    UILabel *yan=[ModelCreat createWithLable:@"研发中心" andFrame:CGRectMake(LABLE_X, LABLE_Y, 200, LABLE_HEIGHT) andTitleColor:[UIColor redColor] andTitleSize:20];
    yan.backgroundColor=[UIColor clearColor];
    [v8 addSubview:yanfa];
    [v8 addSubview:yan];



    

    

    

    
    
    
    self.leftBtn=[ModelCreat createWithNormalImage:[UIImage imageNamed:@"pull_out.png"]
                                               andFrame:CGRectMake(0, 748/2-25, 50, 80)
                                        andPressedImage:[UIImage imageNamed:@"pull_out.png"]
                                               andTitle:nil
                                              andTarget:self
                                              andAction:@selector(pushView:)
                                               andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    
    self.leftView=[ModelCreat
                   createWithImageview:[UIImage imageNamed:@"nav_bg"]
                   andFrame:CGRectMake(-200, 748/2-250, 200, 500)];
    self.leftView.userInteractionEnabled = YES;
    [self.view addSubview:self.leftView];
    
       
    //左边view上的：博看家园，精英师资，就业明星，联系我们，厦门博看介绍，项目实训，校企合作，研发中心
    for (int i=0; i<8; i++) {
        UIView * tmp =[ModelCreat
                           createWithView:[UIImage imageNamed:[NSString stringWithFormat:@"snav%d@2x",i+1]]
                           andFrame:CGRectMake(i%2*100+20,i/2*120 , 60, 60)
                           andViewWithTag:1000+i];
        UITapGestureRecognizer *dian=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch:)];
        [tmp addGestureRecognizer:dian];
        [self.leftView addSubview:tmp];
                
    }
    
    
    self.titleAry=[[NSMutableArray alloc]initWithObjects:@"博看家园",@"精英师资",@"就业明星",@"联系我们",@"博看介绍",@"项目实训",@"校企合作",@"研发中心", nil];
    for (int i=0; i<8; i++) {
        UILabel *titleLable=[ModelCreat
                             createWithLable:[NSString stringWithFormat:@"%@",self.titleAry[i]]
                             andFrame:CGRectMake(i%2*90,i/2*120+80 , 120, 20)
                             andTitleColor:[UIColor redColor]
                             andTitleSize:17];
        titleLable.backgroundColor=[UIColor clearColor];
        titleLable.textAlignment=NSTextAlignmentCenter;
        titleLable.userInteractionEnabled=YES;
        [self.leftView addSubview:titleLable];
        
    }
    
    //创建右边竖条的button
    //下载button
    UIButton *downBtn=[ModelCreat createWithNormalImage:[UIImage imageNamed:@"showDownload"]
                                                andFrame:CGRectMake(940, 400, 55, 55)
                                         andPressedImage:[UIImage imageNamed:@"showDownload@2x"]
                                                andTitle:nil
                                               andTarget:self
                                               andAction:@selector(xiazai:)
                                                andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:downBtn];
    
    //最近搜索button
    UIButton *zuijinBtn=[ModelCreat
                         createWithNormalImage:[UIImage imageNamed:@"showHistory"]
                         andFrame:CGRectMake(940, 470, 55, 55)
                         andPressedImage:[UIImage imageNamed:@"showHistory@2x"]
                         andTitle:nil
                         andTarget:self
                         andAction:@selector(zuijing:)
                         andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:zuijinBtn];
    
    //收藏button
    UIButton *shoucangBtn=[ModelCreat
                           createWithNormalImage:[UIImage imageNamed:@"showFavor"]
                           andFrame:CGRectMake(940, 540, 55, 55)
                           andPressedImage:[UIImage imageNamed:@"showFavor@2x"]
                           andTitle:nil
                           andTarget:self
                           andAction:@selector(shoucang:)
                           andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:shoucangBtn];
    
    //搜索button
    UIButton *searchBtn=[ModelCreat
                         createWithNormalImage:[UIImage imageNamed:@"showSearch"]
                         andFrame:CGRectMake(940, 610, 55, 55)
                         andPressedImage:[UIImage imageNamed:@"showSearch@2x"]
                         andTitle:nil
                         andTarget:self
                         andAction:@selector(search:)
                         andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    //帮助button
    UIButton *helpBtn=[ModelCreat
                       createWithNormalImage:[UIImage imageNamed:@"showRefer"]
                       andFrame:CGRectMake(940, 680, 55, 55)
                       andPressedImage:[UIImage imageNamed:@"showRefer@2x"]
                       andTitle:nil
                       andTarget:self
                       andAction:@selector(help:)
                       andEvent:UIControlEventTouchUpInside];
    [self.view addSubview:helpBtn];
    
    //显示博看文思的图标
    UIImageView *bokan=[ModelCreat createWithImageview:[UIImage imageNamed:@"bokan"]
                                              andFrame:CGRectMake(1024/2-80, 0, 151, 60)];
    [self.view addSubview:bokan];
    
    
    self.pla=[[PlayerView alloc]initWithFrame:CGRectMake(100,2048, 742, 727)];
//    self.pla.playMovie.view.frame=CGRectMake(0, 2048, 580, 435);
    [self.view addSubview:self.pla];
  
	// Do any additional setup after loading the view, typically from a nib.
}

//下载
-(void)xiazai:(id)sender
{
    DownLoadViewController *five=[[DownLoadViewController alloc]init];
    [self presentViewController:five animated:YES completion:^{
        NULL;   
    }];
}

//最近搜索
-(void)zuijing:(id)sender
{
    BoFangJiLuViewController *bo=[[BoFangJiLuViewController alloc]init];
    [self presentViewController:bo animated:YES completion:^{
        NULL;
    }];
}

//收藏
-(void)shoucang:(id)sender
{
    ShouCangViewController *shou=[[ShouCangViewController alloc]init];
    [self presentViewController:shou animated:YES completion:^{
        NULL;
    }];
}

//搜索
-(void)search:(id)sender
{
    SearchbViewController *search=[[SearchbViewController alloc]init];
    [self presentViewController:search animated:YES completion:^{
        NULL;
    }];
}

//帮助
-(void)help:(id)sender
{
    HelpViewController *help=[[HelpViewController alloc]init];
    [self presentViewController:help animated:YES completion:^{
        NULL;
    }];
}


int flag=1;
-(void)pushView:(id)sender
{
    if (flag==1) {
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame=CGRectMake(0, 748/2-250, 200, 500);
            self.sc.frame=CGRectMake(200, 0, 1024, 748);
            self.leftBtn.frame=CGRectMake(200, 748/2-25, 50, 80);
        }];
       
        flag=2;
    }else if (flag==2)
    {
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame=CGRectMake(-200, 748/2-250, 200, 500);
            self.sc.frame=CGRectMake(0, 0, 1024, 748);
            self.leftBtn.frame=CGRectMake(0, 748/2-25, 50, 80);
        }];
        
        flag=1;
    }
}

-(void)moveRight:(UISwipeGestureRecognizer*)sender
{
    if (self.myPage.currentPage==0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame=CGRectMake(0, 748/2-250, 200, 500);
            self.sc.frame=CGRectMake(200, 0, 1024, 748);
            self.leftBtn.frame=CGRectMake(200, 748/2-25, 50, 80);
            flag=2;
          
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void)moveLeft:(UISwipeGestureRecognizer*)sender
{
    if (self.sc.contentOffset.x>=0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.leftView.frame=CGRectMake(-200, 748/2-250, 200, 500);
            self.sc.frame=CGRectMake(0, 0, 1024, 748);
            self.leftBtn.frame=CGRectMake(0, 748/2-25, 50, 80);
            self.sc.scrollEnabled=YES;
        } completion:^(BOOL finished) {
            
        }];
        
        if (self.myPage.currentPage!=0)
        {
            self.sc.scrollEnabled=YES;
           
        }
        
    }
    else
    {
    [UIView animateWithDuration:0.5 animations:^{
        self.sc.contentOffset=CGPointMake(1024, 0);
        self.myPage.currentPage=1;
        self.sc.scrollEnabled=YES;
    }];
    }

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.myPage.currentPage==0) {
        self.sc.scrollEnabled=NO;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveDefault:(id)sender
{

    self.autochange ++;
    if (self.autochange == 8) {
        self.autochange = 0;
    }
    
    [self.xiaoSc scrollRectToVisible:CGRectMake(self.autochange * 500, 0, 500, 300) animated:YES];
}



@end
