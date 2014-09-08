//
//  PopAnimator.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-5.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "PopAnimator.h"
#import "ContainerView.h"
#import "ContainerViewController.h"

@implementation PopAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
//    if ([toViewController isKindOfClass:[ContainerViewController class]]) {
//        ContainerViewController *containerViewController=(ContainerViewController *)toViewController;
//        toViewController=[containerViewController.childViewControllers objectAtIndex:containerViewController.currentControllerIndex];
//    }
    
    //    [[transitionContext containerView] addSubview:toViewController.view];
    //    toViewController.view.alpha = 0;
    //
    //    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    //        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
    //        toViewController.view.alpha = 1;
    //    } completion:^(BOOL finished) {
    //        fromViewController.view.transform = CGAffineTransformIdentity;
    //        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    //
    //    }];
    
    CGFloat width = fromViewController.view.frame.size.width;
    CGFloat height = fromViewController.view.frame.size.height;
    
    float duration=.5f;
    
    [UIView animateWithDuration:duration-.35f animations:^{
        fromViewController.view.frame=CGRectMake(0 - width, 0, width, height);
    }];
    //
    //    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:.6 initialSpringVelocity:5 options:UIViewAnimationOptionTransitionNone animations:^{
    //
    //    } completion:^(BOOL finished) {
    //
    //    }];
    
    [[transitionContext containerView] addSubview:toViewController.view];
    
    float delay=0.f;
    int offset=-400;
    
    //    if (!forward) {
    //        offset=-offset;
    //    }
    
    //    NSLog(@"to view controller: %@",toViewController);
    
    //    __block int count=0;
    //
    
    
    UIViewController *_controller=toViewController;
    
        if ([toViewController isKindOfClass:[ContainerViewController class]]) {
            ContainerViewController *containerViewController=(ContainerViewController *)toViewController;
            _controller=[containerViewController.childViewControllers objectAtIndex:containerViewController.currentControllerIndex];
        }
    
    for (UIView *v in _controller.view.subviews) {
        //    for (UIView *v in ((UINavigationController *)_controller).topViewController.view.subviews) {
        
//        if ([v isKindOfClass:[ContainerView class] ]) {
//            NSLog(@"has container view ... ");
//            for (UIView *subV in v.subviews) {
//                subV.center=CGPointMake(subV.center.x+offset, subV.center.y);
//                
//                [UIView animateWithDuration:duration delay:delay
//                     usingSpringWithDamping:.7 initialSpringVelocity:10
//                                    options:0 animations:^{
//                                        subV.center=CGPointMake(subV.center.x-offset, subV.center.y);
//                                    } completion:^(BOOL finished){
//                                        
//                                    }];
//                delay+=.05f;
//            }
//            
//        }else{
            v.center=CGPointMake(v.center.x+offset, v.center.y);
            
            [UIView animateWithDuration:duration delay:delay
                 usingSpringWithDamping:.7 initialSpringVelocity:10
                                options:0 animations:^{
                                    v.center=CGPointMake(v.center.x-offset, v.center.y);
                                } completion:^(BOOL finished){
                                    
                                }];
            delay+=.05f;
//        }
    }
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}

@end
