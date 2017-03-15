//
//  CFRunLoopTool.m
//  Json
//
//  Created by 韩森 on 2017/3/15.
//  Copyright © 2017年 hansen. All rights reserved.
//

#import "CFRunLoopTool.h"


@implementation CFRunLoopTool


+(void)addTask:(RunloopBlock)task{
    
    CFRunLoopTool *tool = [[CFRunLoopTool alloc] init];
    
    [tool.taskArray addObject:task];
    
    if (tool.taskArray.count > 20) {
        
        [tool.taskArray removeObjectAtIndex:0];
    }
    
}

static void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity actity ,void *info){
    
   CFRunLoopTool * tool = (__bridge CFRunLoopTool *)info;
    
    if (tool.taskArray.count == 0) {
        
        return;
    }
    RunloopBlock task = tool.taskArray.firstObject;
    task();
    
    [tool.taskArray removeObjectAtIndex:0];
    NSLog(@"哥们来了");
};

-(void)addRunloopObserver{
    //拿到当前 Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
    //定义上下文
    CFRunLoopObserverContext context ={
    0,
    (__bridge void *)self,
    &CFRetain,
    &CFRelease,
    NULL
    };
    
    //定义一个观察者;
    
    static CFRunLoopObserverRef defaultModelObserver;
    // 创建观察者 从 kCFRunLoopBeforeWaiting 中醒来
    defaultModelObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &callBack, &context);
    
    // 添加 runloop 观察者
    CFRunLoopAddObserver(runloop, defaultModelObserver, kCFRunLoopDefaultMode);
    
    // C语言 有creat 所以需要 release
    CFRelease(defaultModelObserver);
    
}
@end
