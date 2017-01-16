//
// Created by Terry Lewis on 16/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMPercentDrivenAnimationEngine.h"
#import "ANMPercentDrivenAnimation.h"
#import <QuartzCore/QuartzCore.h>


@implementation ANMPercentDrivenAnimationEngine {
    CADisplayLink *_displayLink;
    NSMutableSet *_activeAnimations;
    NSMutableSet *_completeAnimations;
}

+ (instancetype)sharedInstance {
    static ANMPercentDrivenAnimationEngine *sharedInstance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
#pragma clang diagnostic push
#pragma ide diagnostic ignored "DeprecatedAPI"
        sharedInstance = [[self alloc] init];
#pragma clang diagnostic pop
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self){
        _activeAnimations = [NSMutableSet set];
        _completeAnimations = [NSMutableSet set];
    }
    return self;
}

- (void)startAnimation:(ANMPercentDrivenAnimation *)animation {
#if defined(__LP64__) && __LP64__
    CGFloat epsilon = DBL_EPSILON;
#else
    CGFloat epsilon = FLT_EPSILON;
#endif

    if (animation.duration > epsilon) {
        [animation reset];

        CFTimeInterval currentTime = CACurrentMediaTime();
        [animation setStartTime:currentTime];
        [animation setLastProgressUpdateTime:currentTime];
        [_activeAnimations addObject:animation];
        [self setupDisplayLink];
    } else {
        [animation executeProgressBlockWithProgress:1];
        [animation executeCompletionBlockWithSuccess:YES];
    }
}

- (void)stopAnimation:(ANMPercentDrivenAnimation *)animation {

}

- (BOOL)animationIsActive:(ANMPercentDrivenAnimation *)animation {
    return [_activeAnimations containsObject:animation];
}

- (void)setupDisplayLink {
    if (!_displayLink){
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayWillRefresh:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)destroyDisplayLink{
    [_displayLink invalidate];
    _displayLink = nil;
}

- (void)displayWillRefresh:(CADisplayLink *)displayLink {
    NSLog(@"Display refreshed.");
    for (ANMPercentDrivenAnimation *animation in _activeAnimations) {
        [animation setLastProgressUpdateTime:displayLink.timestamp];
        [animation executeProgressBlockWithProgress:animation.animationProgress];
        if (animation.isFinished){
            [_completeAnimations addObject:animation];
        }
    }

    if (_completeAnimations.count){
        [_activeAnimations minusSet:_completeAnimations];
        for (ANMPercentDrivenAnimation *finishedAnimation in _completeAnimations){
            [finishedAnimation executeCompletionBlockWithSuccess:YES];
        }
        [self configureDisplayLink];
    }
}

- (void)configureDisplayLink {
    if (_activeAnimations.count){

    }else{
        [self destroyDisplayLink];
    }
}

- (void)animationDidMutate:(ANMPercentDrivenAnimation *)animation {

}

@end