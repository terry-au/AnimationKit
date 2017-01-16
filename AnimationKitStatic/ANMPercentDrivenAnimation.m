//
// Created by Terry Lewis on 16/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMPercentDrivenAnimation.h"
#import "ANMTimingFunction.h"
#import "ANMPercentDrivenAnimationEngine.h"


@implementation ANMPercentDrivenAnimation {
    ANMPercentDrivenAnimationEngine *_animationEngine;
}

- (instancetype)init {
    self = [super init];
    if (self){
        _animationEngine = [ANMPercentDrivenAnimationEngine sharedInstance];
        self.timingFunction = [ANMTimingFunction functionWithAnimationCurve:ANMAnimationCurveEaseInEaseOut];
    }
    return self;
}

- (void)start {
    [_animationEngine startAnimation:self];
}

- (void)stop {
    [_animationEngine stopAnimation:self];
}

- (void)reset{
    _lastProgressUpdateTime = 0;
    _elapsedTime = 0;
}

- (BOOL)isRunning {
    return [_animationEngine animationIsActive:self];
}

- (BOOL)isFinished {
    return self.elapsedTime >= self.duration;
}

- (CGFloat)progressFromAbsoluteProgress:(CGFloat)absoluteProgress {
    return [self.timingFunction valueForX:absoluteProgress];
}


- (void)setFrameInterval:(NSInteger)frameInterval {
    NSInteger adjustedInterval = MAX(frameInterval, 1);
    if (_frameInterval != adjustedInterval){
        _frameInterval = adjustedInterval;
        [_animationEngine animationDidMutate:self];
    }
}


@end