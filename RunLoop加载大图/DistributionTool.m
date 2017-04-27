//
//  Distribution.m
//  RunLoop加载大图
//
//  Created by Gao on 17/4/26.
//  Copyright © 2017年 Gao. All rights reserved.
//

#import "DistributionTool.h"

static DistributionTool *_singleton = nil;

@interface DistributionTool()

@property(nonatomic,strong) NSMutableArray *tasks;

@property(nonatomic,strong) NSTimer *timer;

@end

@implementation DistributionTool

-(void)timeUp
{
    //Nothing To do
}

-(instancetype)init
{
    if (self = [super init])
    {
        _tasks = [NSMutableArray array];
        _maxTask = 30;
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeUp) userInfo:nil repeats:YES];
    }
    return self;
}

+(instancetype)sharedDistributionTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[DistributionTool alloc] init];
        [self registerObserver];
    });
    return _singleton;
}

+(void)registerObserver
{
    CFRunLoopRef mainLoop = CFRunLoopGetCurrent();
    
    CFRunLoopObserverContext ctx =
    {
        0,
        (__bridge void *)(_singleton),
        NULL,
        NULL,
        NULL
    };
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, 0 , RunLoopObserverCallBack, &ctx);
    
    CFRunLoopAddObserver(mainLoop, observer, kCFRunLoopDefaultMode);
    
    CFRelease(observer);
}

 void RunLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info)
{
    
    DistributionTool *tool = (__bridge DistributionTool *)info;
    
    if (tool.tasks.count == 0)
    {
        return;
    }
    
    BOOL isFinish = NO;
    
    while (isFinish == NO && tool.tasks.count)
    {
        loadTask task = tool.tasks.firstObject;
        
        isFinish = task();
        
        [tool.tasks removeObjectAtIndex:0];
    }
}

-(void)addTask:(loadTask)task
{
    [self.tasks addObject:task];
    
    if(self.tasks.count > self.maxTask)
    {
        [self.tasks removeObjectAtIndex:0];
    }
}
@end
