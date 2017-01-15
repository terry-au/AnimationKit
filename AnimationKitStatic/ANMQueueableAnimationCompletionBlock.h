//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANMQueueableAnimation-Protocol.h"
#import "ANMTypes.h"


@interface ANMQueueableAnimationCompletionBlock : NSObject

@property (nonatomic, copy) ANMCompletionBlock completion;
@property (nonatomic, retain) id <ANMQueueableAnimation> animation;

+ (instancetype)completionBlockWithCompletionBlock:(ANMCompletionBlock)completionBlock;

- (void)invokeCompletionBlockWithFinished:(BOOL)finished processingMode:(ANMAnimationQueueProcessingMode)processingMode;

@end