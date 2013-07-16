//
//  Collect.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collect : NSObject
//建立属性与数据库映射，面向对象的收藏类与关系型数据表的映射
@property(assign,nonatomic)int imgId;
@property(retain,nonatomic)UIImage *img;
@property(retain,nonatomic)NSString *str;

//添加数据的方法
+(void)addImage:(UIImage *)img andD:(NSString *)str;

//根据id删除数据的方法
+(void)deleteImgWithId:(int)imgId;

//查询所有数据的方法
+(NSMutableArray *)findall;

//根据id查询返回结果
+(Collect *)findByid:(int)collectId;

@end
