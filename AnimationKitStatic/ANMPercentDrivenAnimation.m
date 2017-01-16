//
// Created by Terry Lewis on 16/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMPercentDrivenAnimation.h"
#import "ANMPercentDrivenAnimationEngine.h"


@implementation ANMPercentDrivenAnimation

- (instancetype)init {
    self = [super init];
    if (self) {
        _animationEngine = [ANMPercentDrivenAnimationEngine sharedInstance];
        self.timingFunction = [ANMTimingFunction functionWithAnimationCurve:ANMAnimationCurveEaseInEaseOut];
    }
    return self;
}

- (void)start {
    [self.animationEngine startAnimation:self];
}

- (void)stop {
    [self.animationEngine stopAnimation:self];
}

- (void)reset {
    _lastProgressUpdateTime = 0;
    _startTime = 0;
}

- (BOOL)isRunning {
    return [self.animationEngine animationIsActive:self];
}

- (BOOL)isFinished {
    return self.elapsedTime >= self.duration;
}

- (void)executeProgressBlockWithProgress:(CGFloat)progress {
    if (self.progressBlock){
        self.progressBlock(progress);
    }
}

- (void)executeCompletionBlockWithSuccess:(BOOL)completion {
    if (self.completionBlock){
        self.completionBlock(completion);
    }
}

- (CFTimeInterval)elapsedTime {
    return self.lastProgressUpdateTime - self.startTime;
}

- (CGFloat)timeProgress {
    return (CGFLOAT_TYPE)MIN(MAX(self.elapsedTime / self.duration, 0.0f), 1.0f);
}

- (CGFloat)animationProgress {
    return [self.timingFunction valueForX:self.timeProgress];
}

- (void)setFrameInterval:(NSInteger)frameInterval {
    NSInteger adjustedInterval = MAX(frameInterval, 1);
    if (_frameInterval != adjustedInterval) {
        _frameInterval = adjustedInterval;

        if (self.isRunning){
            [self.animationEngine activeAnimationDidMutate:self];
        }
    }
}


@end