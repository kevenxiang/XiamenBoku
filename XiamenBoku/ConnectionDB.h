//
//  ConnectionDB.h
//  XiamenBoku
//
//  Created by ibokan on 13-7-16.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface ConnectionDB : NSObject

//获取可用的数据连接对象
+(sqlite3 *)createDB;

@end
