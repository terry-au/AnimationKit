//
// Created by Terry Lewis on 16/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ANMPercentDrivenAnimation;


@interface ANMPercentDrivenAnimationEngine : NSObject

+ (instancetype)sharedInstance;

- (instancetype)init NS_UNAVAILABLE;

- (void)startAnimation:(ANMPercentDrivenAnimation *)animation;
- (void)stopAnimation:(ANMPercentDrivenAnimation *)animation;

- (BOOL)animationIsActive:(ANMPercentDrivenAnimation *)animation;

- (void)activeAnimationDidMutate:(ANMPercentDrivenAnimation *)animation;
@end