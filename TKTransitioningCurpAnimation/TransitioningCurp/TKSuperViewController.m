//
//  TKSuperViewController.m
//  TKTransitioningCurpAnimation
//
//  Created by tinkl on 9/5/14.
//  Copyright (c) 2014 ___TINKL___. All rights reserved.
//

#import "TKSuperViewController.h"
#import "TKPushAnimation.h"
#import "TKSwipeUpInteractiveTransition.h"
@interface TKSuperViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) TKPushAnimation *presentAnimation;
@property (nonatomic, strong) TKSwipeUpInteractiveTransition *transitionController;

@end

@implementation TKSuperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _presentAnimation = [[TKPushAnimation alloc] init];
        _transitionController = [[TKSwipeUpInteractiveTransition alloc] init];
    }
    return self;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}



#pragma mark - UINavigationController Delegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return self.presentAnimation;
    }
    
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.transitionController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitioningDelegate = self;
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
