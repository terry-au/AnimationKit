//
//  ANMTypes.h
//  AnimationKit
//
//  Created by Terry Lewis on 15/1/17.
//  Copyright (c) 2017 terry1994. All rights reserved.
//

#ifndef ANMTypes_h
#define ANMTypes_h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSUInteger, ANMAnimationQueueProcessingMode) {
    ANMAnimationQueueProcessingModeContinueBeforeCompletion,
    ANMAnimationQueueProcessingModeContinueAfterCompletion
};

typedef void (^ANMProgressBlock)(CGFloat progress);

typedef void (^ANMCompletionBlock)(BOOL completion);

typedef void (^ANMAnimationBlock)(void);

#endif /* ANMTypes_h */
