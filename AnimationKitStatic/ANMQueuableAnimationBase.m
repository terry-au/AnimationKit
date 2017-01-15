//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMQueuableAnimationBase.h"
#import "ANMQueueableAnimationCompletionBlock.h"
#import "ANMAnimationQueue-Private.h"

@implementation ANMQueuableAnimationBase {
    ANMQueueableAnimationCompletionBlock *_completionBlock;
}

- (instancetype)initWithAnimation:(ANMAnimationBlock)animation completion:(ANMCompletionBlock)completion {
    if (!animation) {
        return nil;
    }

    if (self = [super init]) {
        self.animation = animation;
        self.completion = completion;
    }

    return self;
}

- (void)invokeCompletionBlockWithFinished:(BOOL)finished {
    if (_completionBlock) {
        [_completionBlock invokeCompletionBlockWithFinished:finished processingMode:self.queue.processingMode];
    }
}

- (void)invokeAnimationBlock {
}

- (void)start {
    [self invokeAnimationBlock];
}

- (void)setCompletion:(ANMCompletionBlock)completion {
    _completionBlock = [ANMQueueableAnimationCompletionBlock completionBlockWithCompletionBlock:completion];
    _completionBlock.animation = self;
}

- (void)_didCompleteAnimationFinished:(BOOL)finished {
    [self.queue _completeAnimation:self];
}

- (ANMCompletionBlock)completion {
    return ^(BOOL finished) {
        [self invokeCompletionBlockWithFinished:finished];
    };
}

@end