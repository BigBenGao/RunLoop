//
//  Distribution.h
//  RunLoop加载大图
//
//  Created by Gao on 17/4/26.
//  Copyright © 2017年 Gao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^loadTask)(void);

@interface DistributionTool : NSObject

@property(nonatomic,assign) NSInteger maxTask;

+(instancetype)sharedDistributionTool;

-(void)addTask:(loadTask)task;

@end
