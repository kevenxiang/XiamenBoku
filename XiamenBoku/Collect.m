//
//  Collect.m
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "Collect.h"
#import "ConnectionDB.h"

@implementation Collect

//添加数据的方法
+(void)addImage:(UIImage *)img andD:(NSString *)str
{

    //读取图片数据
    NSData *data=UIImagePNGRepresentation(img);
    sqlite3 *sql3=[ConnectionDB createDB];
    sqlite3_stmt *st;
    int p=sqlite3_prepare_v2(sql3, "insert into Mycollect(image,describe) values(?,?)", -1, &st, nil);
    if (p==SQLITE_OK) {
        sqlite3_bind_blob(st, 1, [data bytes], [data length], nil);
        sqlite3_bind_text(st, 2, [str UTF8String], -1, nil);
        sqlite3_step(st);
    }
    sqlite3_finalize(st);
}

//根据id删除数据的方法
+(void)deleteImgWithId:(int)imgId
{
    sqlite3 *sql3=[ConnectionDB createDB];
    sqlite3_stmt *st;
    NSString *sqlStr=[NSString stringWithFormat:@"delete from Mycollect where collectId=%d",imgId];
    int p=sqlite3_prepare_v2(sql3, [sqlStr UTF8String], -1, &st, nil);
    if (p==SQLITE_OK) {
        sqlite3_step(st);
    }
    sqlite3_finalize(st);
}

//查询所有数据的方法
+(NSMutableArray *)findall
{
    NSMutableArray *imgArray=nil;
    sqlite3 *sql3=[ConnectionDB createDB];
    sqlite3_stmt *st;
    int p=sqlite3_prepare_v2(sql3, "select * from Mycollect", -1, &st, nil);
    if (p==SQLITE_OK) {
        imgArray=[[NSMutableArray alloc]init];
        while (sqlite3_step(st)==SQLITE_ROW) {
            Collect *collet=[[Collect alloc]init];
            collet.imgId=sqlite3_column_int(st, 0);
            collet.str=[NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
//            int length=sqlite3_column_bytes(st, 1);
//            Byte *imageByte=(Byte *)sqlite3_column_blob(st, 1);
//            NSData *imageData=[NSData dataWithBytes:imageByte length:length];
//            collet.img=[[UIImage alloc]initWithData:imageData];
            [imgArray addObject:collet];
            NSLog(@"查询所有数据的方法");
        }
    }
    sqlite3_finalize(st);
    return imgArray;
}

//根据id查询返回结果
+(Collect *)findByid:(int)collectId
{
    Collect *col=nil;
    sqlite3 *sql3=[ConnectionDB createDB];
    sqlite3_stmt *st;
    NSString *sqlStr=[NSString stringWithFormat:@"select * from Mycollect where collectId=%d",collectId];
    int p=sqlite3_prepare_v2(sql3, [sqlStr UTF8String], -1, &st, nil);
    if (p==SQLITE_OK) {
        
        
        if (sqlite3_step(st)==SQLITE_ROW) {
            NSLog(@"SQL语句执行正确");
        }else
        {
            NSLog(@"出错");
        }
        
        while (sqlite3_step(st)==SQLITE_ROW) {
            col=[[Collect alloc]init];
            col.imgId=sqlite3_column_int(st, 0);
            col.str=[NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
    
        }
    }
    sqlite3_finalize(st);
    return col;
}

@end
