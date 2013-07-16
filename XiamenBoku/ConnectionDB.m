//
//  ConnectionDB.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ConnectionDB.h"

@implementation ConnectionDB

static sqlite3 *instanc=nil;

+(sqlite3 *)createDB
{
    if (instanc!=nil) {
        return instanc;
    }
    //数据库文件的原路径
    NSString *sourcePath=[[NSBundle mainBundle]pathForResource:@"boku" ofType:@"sqlite"];
    //数据库文件的目标路径
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *targetPath=[docPath stringByAppendingPathComponent:@"boku.sqlite"];
    NSFileManager *fm=[NSFileManager defaultManager];
    NSError *error=nil;
    if (![fm fileExistsAtPath:targetPath]) {
        if ([fm copyItemAtPath:sourcePath toPath:targetPath error:&error]) {
            NSLog(@"拷贝文件成功");
        }else
        {
            NSLog(@"error=%@",error);
            return instanc;
        }
    }
    sqlite3_open([targetPath UTF8String], &instanc);
    NSLog(@"instanc=%p",instanc);
    return instanc;
}

@end
