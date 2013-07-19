//
//  LinkViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-19.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "LinkViewController.h"

@interface LinkViewController ()

@end

@implementation LinkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goBtn:(id)sender {
    
    [self.searchB resignFirstResponder];
    NSString *path=self.searchB.text;
    NSLog(@"%@",self.searchB.text);
    NSURL *url=[NSURL URLWithString:path];
    [self.webV loadRequest:[NSURLRequest requestWithURL:url]];
}

-(void)loadWebPageWithString:(NSString *)urlString
{
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webV loadRequest:request];
}

- (IBAction)closeBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NULL;
    }];
    
}

//开始加载数据
//- (void)webViewDidStartLoad:(UIWebView *)webView {
//    [self.activityIndicator startAnimating];
//}
//
////数据加载完
//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [self.activityIndicator stopAnimating];
//    UIView *view = (UIView *)[self.view viewWithTag:103];
//    [view removeFromSuperview];
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webV=[[UIWebView alloc]initWithFrame:CGRectMake(0, 50, 1024, 748)];
    self.webV.scalesPageToFit=YES;
    self.webV.delegate=self;
    [self.webV setOpaque:NO];
    NSString *path=@"http://www.xmbokanedu.com";
    NSURL *url=[NSURL URLWithString:path];
    [self.webV loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.searchB.delegate=self;
    
    [self.view addSubview:self.webV];
    
    
    self.searchB=[[UISearchBar alloc]init];
 

    [self.view addSubview:self.webV];
    
    
//    //创建UIActivityIndicatorView背底半透明View
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(500, 200, 320, 480)];
//    [view setTag:103];
//    [view setBackgroundColor:[UIColor blackColor]];
//    [view setAlpha:0.8];
//    [self.view addSubview:view];
//    
//    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
//    [self.activityIndicator setCenter:view.center];
//    [self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
//    [view addSubview:self.activityIndicator];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
