//
// Created by Terry Lewis on 15/1/17.
// Copyright (c) 2017 terry1994. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef NS_ENUM(NSInteger, ANMAnimationCurve) {
    ANMAnimationCurveEaseInEaseOut,
    ANMAnimationCurveEaseIn,
    ANMAnimationCurveEaseOut,
    ANMAnimationCurveLinear
};

@interface ANMTimingFunction : NSObject

+ (instancetype)functionWithAnimationCurve:(ANMAnimationCurve)curve;

+ (instancetype)functionWithName:(NSString *)name;

@property (nonatomic) CGFloat duration;

- (CGFloat)valueForX:(CGFloat)x;

@end