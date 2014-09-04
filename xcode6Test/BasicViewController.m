//
//  BasicViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-3.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()
{
    
    IBOutletCollection(UIView) NSArray *shakeViews;
    BOOL hasCreated;
}

@end

@implementation BasicViewController

-(void)viewWillDisappear:(BOOL)animated
{
    float delay=0.5;
    int offset=300;
    
    if (!hasCreated) {
        offset=-offset;
        hasCreated=YES;
    }
    
    for (UIView *v in shakeViews) {
        v.center=CGPointMake(v.center.x-offset, v.center.y);
        
        [UIView animateWithDuration:.5 delay:delay
             usingSpringWithDamping:.5 initialSpringVelocity:0.8f
                            options:0 animations:^{
                                v.center=CGPointMake(v.center.x+offset, v.center.y);
                            } completion:nil];
        delay+=0.05;
        
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    float delay=0.5;
    int offset=300;
    
    if (!hasCreated) {
        offset=-offset;
        hasCreated=YES;
    }
    
    for (UIView *v in shakeViews) {
        v.center=CGPointMake(v.center.x-offset, v.center.y);
        
        [UIView animateWithDuration:.5 delay:delay
             usingSpringWithDamping:.5 initialSpringVelocity:0.8f
                            options:0 animations:^{
                                v.center=CGPointMake(v.center.x+offset, v.center.y);
                            } completion:nil];
        delay+=0.05;
        
    }
}

@end
