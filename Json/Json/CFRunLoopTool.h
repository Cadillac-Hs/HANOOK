//
//  CFRunLoopTool.h
//  Json
//
//  Created by 韩森 on 2017/3/15.
//  Copyright © 2017年 hansen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RunloopBlock)(void);

@interface CFRunLoopTool : NSObject

@property (nonatomic,strong) NSMutableArray *taskArray;

+(void)addTask:(RunloopBlock)task;
@end
