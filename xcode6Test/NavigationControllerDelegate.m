//
//  NavigationControllerDelegate.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-5.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "Animator.h"
#import "PopAnimator.h"

@implementation NavigationControllerDelegate

{
    Animator *animator;
    PopAnimator *popAnimator;
    
}

- (id)init {
    self = [super init];
    if (self) {
        animator=[[Animator alloc] init];
        popAnimator=[PopAnimator new];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return animator;
    }
    
    if (operation==UINavigationControllerOperationPop) {
        NSLog(@"pop, to controller: %@",toVC);
        return popAnimator;
    }
    
    return nil;
}

@end
