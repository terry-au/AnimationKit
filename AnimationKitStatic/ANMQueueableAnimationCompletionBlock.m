//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import "ANMQueueableAnimationCompletionBlock.h"


@implementation ANMQueueableAnimationCompletionBlock {

}

+ (instancetype)completionBlockWithCompletionBlock:(ANMCompletionBlock)completionBlock {
    return [[self alloc] initWithCompletionBlock:completionBlock];
}

- (instancetype)initWithCompletionBlock:(ANMCompletionBlock)completionBlock {
    if (self = [super init]) {
        self.completion = completionBlock;
    }
    return self;
}

- (void)invokeCompletionBlockWithFinished:(BOOL)finished processingMode:(ANMAnimationQueueProcessingMode)processingMode {
    if (processingMode == ANMAnimationQueueProcessingModeContinueBeforeCompletion) {
        [self.animation _didCompleteAnimationFinished:finished];
    }

    self.completion(finished);

    if (processingMode == ANMAnimationQueueProcessingModeContinueAfterCompletion) {
        [self.animation _didCompleteAnimationFinished:finished];
    }
}

@end