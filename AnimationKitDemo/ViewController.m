//
//  ViewController.m
//  AnimationKitDemo
//
//  Created by Terry Lewis on 15/1/17.
//  Copyright © 2017 terry1994. All rights reserved.
//

#import "ViewController.h"
#import "ANMPercentDrivenAnimationEngine.h"
#import "ANMPercentDrivenAnimation.h"

@interface ViewController (){
    UIView *_squareView;
    ANMPercentDrivenAnimation *_animation1;
    ANMPercentDrivenAnimation *_animation2;
    ANMPercentDrivenAnimation *_animation3;
    ANMPercentDrivenAnimation *_animation4;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _squareView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _squareView.center = self.view.center;
    _squareView.backgroundColor = UIColor.redColor;
    [self.view addSubview:_squareView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    _squareView.layer.borderColor = [UIColor blackColor].CGColor;
    
    _animation1 = [[ANMPercentDrivenAnimation alloc] init];
    _animation1.frameInterval = 100;
    _animation1.duration = 5;
    [_animation1 setProgressBlock:^(CGFloat progress) {
        _squareView.layer.cornerRadius = 50.0 * progress;
    }];
    [_animation1 setCompletionBlock:^(BOOL completion) {
        _squareView.backgroundColor = [UIColor greenColor];
    }];

    
    _animation2 = [[ANMPercentDrivenAnimation alloc] init];
    _animation2.frameInterval = 11;
    _animation2.duration = 5;
    [_animation2 setProgressBlock:^(CGFloat progress) {
        _squareView.layer.borderWidth = 10 * progress;
    }];


    _animation3 = [[ANMPercentDrivenAnimation alloc] init];
    _animation3.frameInterval = 50;
    _animation3.duration = 5;
    [_animation3 setProgressBlock:^(CGFloat progress) {
        _squareView.layer.borderWidth = 10 * progress;
    }];


    _animation4 = [[ANMPercentDrivenAnimation alloc] init];
    _animation4.frameInterval = 20;
    _animation4.duration = 5;
    [_animation4 setProgressBlock:^(CGFloat progress) {
        _squareView.layer.borderWidth = 10 * progress;
    }];

    [_animation1 start];
    [_animation2 start];
    [_animation3 start];
    [_animation4 start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
