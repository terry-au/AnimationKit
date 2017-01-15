//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANMTypes.h"
#import "ANMQueueableAnimation-Protocol.h"

@interface ANMQueuableAnimationBase : NSObject <ANMQueueableAnimation>

@property (nonatomic, copy) ANMAnimationBlock animation;

@property (nonatomic, copy) ANMCompletionBlock completion;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithAnimation:(ANMAnimationBlock)animation completion:(ANMCompletionBlock)completion NS_DESIGNATED_INITIALIZER;

- (void)setCompletion:(ANMCompletionBlock)completion;

@end