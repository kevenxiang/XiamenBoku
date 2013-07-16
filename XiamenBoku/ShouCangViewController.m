//
//  ShouCangViewController.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-14.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ShouCangViewController.h"
#import "ModelCreat.h"
#import "Collect.h"
#import "MyCell.h"

@interface ShouCangViewController ()

@end

@implementation ShouCangViewController

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
    
    self.centerLable=[ModelCreat createWithLable:@"我的收藏"
                                        andFrame:CGRectMake(1024/2-50, 20, 100, 20)
                                   andTitleColor:nil
                                    andTitleSize:20];
    self.centerLable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.centerLable];

    self.table=[[UITableView alloc]init];
    self.table.frame=CGRectMake(0, 120, 1024, 748);
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.table setSeparatorColor:[UIColor clearColor]];
    self.table.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1.png"]];
    [self.view addSubview:self.table];
    
    self.gotDataAry=[[NSMutableArray alloc]init];
    Collect *col=[Collect findByid:0];
    NSLog(@"str=%@",col);

//    NSLog(@"得到的数据:%@",self.gotDataAry);
//    for (int i=0; i<self.gotDataAry.count; i++) {
//        NSString *str=[self.gotDataAry objectAtIndex:i];
//        NSLog(@"str=%@",str);
//    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellStr=@"cell";
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell==nil) {
        cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.view1.frame=CGRectMake(26, 0, 230, 200);
    cell.imgV1.image=[UIImage imageNamed:[self.gotDataAry objectAtIndex:indexPath.row*2]];
    
     
    
    
    
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}



@end
