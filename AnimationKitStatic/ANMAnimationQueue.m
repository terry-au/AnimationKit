//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMAnimationQueue.h"
#import "ANMQueuableAnimationBase.h"


@implementation ANMAnimationQueue {
    BOOL _stopped;
}

- (instancetype)init {
    if (self = [super init]) {
        _stopped = YES;
        _paused = NO;
        _animations = [[NSMutableOrderedSet alloc] init];
    }
    return self;
}

- (void)enqueueAnimation:(id <ANMQueueableAnimation>)animation {
    if (animation) {
        animation.queue = self;
        [_animations addObject:animation];
    }
    NSLog(@"%i", _stopped);
    if (!self._stopped && !self.currentAnimation) {
        [self _startNextAnimation];
    }
}

- (void)_completeAnimation:(id <ANMQueueableAnimation>)animation {
    [_animations removeObject:animation];
    [self _startNextAnimation];
}

- (void)start {
    [self startAnimationsWithCompletionBlock:nil];
}

- (void)startAnimationsWithCompletionBlock:(ANMCompletionBlock)completionBlock {
    _paused = NO;
    _stopped = NO;
    self.queueCompletionBlock = completionBlock;
    [self _startNextAnimation];
}

- (void)cancel {
    [self stopWithFinished:NO];
}

- (void)pause {
    _paused = YES;
}

- (BOOL)_stopped {
    return _paused != _stopped;
}

- (void)stopWithFinished:(BOOL)finished {
    _stopped = YES;
    if (self.queueCompletionBlock) {
        self.queueCompletionBlock(finished);
    }
}

- (void)_startNextAnimation {
    if (!self._stopped && _animations.count) {
        ANMQueuableAnimationBase *animation = [_animations firstObject];
        self.currentAnimation = animation;
        [animation start];
    } else {
        self.currentAnimation = nil;
        if (self.stopQueueOnFinish) {
            [self stopWithFinished:YES];
        }
        [self stopWithFinished:YES];
    }
}

@end