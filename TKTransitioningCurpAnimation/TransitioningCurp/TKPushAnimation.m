//
//  TKPushAnimation.m
//  TKTransitioningCurpAnimation
//
//  Created by tinkl on 9/5/14.
//  Copyright (c) 2014 ___TINKL___. All rights reserved.
//

#import "TKPushAnimation.h"

@implementation TKPushAnimation

static NSTimeInterval const DEAnimatedTransitionDuration = 0.5f;
//static NSTimeInterval const DEAnimatedTransitionMarcoDuration = 0.15f;

#pragma mark - UIViewControllerAnimatedTransitioning Delegate

/* 动画切换的持续时间，以秒为单位 */
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return DEAnimatedTransitionDuration;
}

// 动画的内容
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *desController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:desController.view];
    desController.view.alpha = .0;
    toController.view.alpha = 1.0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         
                         desController.view.alpha = 1.0;
                         toController.view.alpha = 1.0;
                         toController.view.transform = CGAffineTransformMakeTranslation(toController.view.bounds.size.width, 0.0);
                     }
                     completion:^(BOOL finished) {
                         
                         toController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
    
    
    
}

@end
