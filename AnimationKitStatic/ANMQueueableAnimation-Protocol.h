//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANMTypes.h"
#import "ANMAnimationQueue.h"

@class ANMAnimationQueue;

@protocol ANMQueueableAnimation <NSObject>

@property (nonatomic) CGFloat duration;
@property (nonatomic) CGFloat delay;
@property (nonatomic, retain) ANMAnimationQueue *queue;

- (void)start;

- (void)invokeCompletionBlockWithFinished:(BOOL)finished;

- (void)invokeAnimationBlock;

- (void)_didCompleteAnimationFinished:(BOOL)finished;

@end