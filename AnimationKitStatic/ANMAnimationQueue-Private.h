//
//  ANMAnimationQueue-Private.h
//  AnimationKit
//
//  Created by Terry Lewis on 15/1/17.
//  Copyright (c) 2017 terry1994. All rights reserved.
//

#ifndef ANMAnimationQueue_Private_h
#define ANMAnimationQueue_Private_h

#import <Foundation/Foundation.h>

@protocol ANMQueueableAnimation;
@class ANMAnimationQueue;

@interface ANMAnimationQueue ()

- (void)_startNextAnimation;

- (void)_completeAnimation:(id <ANMQueueableAnimation>)animation;

@end

#endif /* ANMAnimationQueue_Private_h */
