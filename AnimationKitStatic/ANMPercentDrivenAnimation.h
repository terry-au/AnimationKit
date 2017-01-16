//
// Created by Terry Lewis on 16/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANMTypes.h"
#import <QuartzCore/QuartzCore.h>
#import "ANMTimingFunction.h"

@interface ANMPercentDrivenAnimation : NSObject

@property (nonatomic) CFTimeInterval startTime;
@property (nonatomic) CFTimeInterval lastProgressUpdateTime;
@property (nonatomic, readonly) CFTimeInterval elapsedTime;
@property (nonatomic) NSInteger frameInterval;
@property (nonatomic) CGFloat duration;
@property (strong, nonatomic) ANMTimingFunction *timingFunction;
@property (nonatomic, retain) ANMPercentDrivenAnimationEngine *animationEngine;
@property (nonatomic, readonly) CGFloat timeProgress;
@property (copy, nonatomic) ANMCompletionBlock completionBlock;
@property (copy, nonatomic) ANMProgressBlock progressBlock;

- (instancetype)init;

- (void)start;

- (void)stop;

- (void)reset;

- (BOOL)isRunning;

- (BOOL)isFinished;

- (void)executeProgressBlockWithProgress:(CGFloat)progress;

- (void)executeCompletionBlockWithSuccess:(BOOL)completion;

- (CGFloat)animationProgress;

@end