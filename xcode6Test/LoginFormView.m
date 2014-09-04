//
//  LoginFormView.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-2.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginFormView.h"

@implementation LoginFormView

{
    
    IBOutletCollection(UIView) NSArray *animSubViews;
    BOOL runningAnim;
}


-(void)setViewsInOrOut:(BOOL)isIn anim:(BOOL)animation
{
    CATransform3D transform = CATransform3DIdentity;
    
    transform = CATransform3DTranslate(transform, isIn?0:-400, 0., 0.0);
    NSLog(@"isIn?0:-400 : %i",(isIn?0:-400));
    
    float delay=1;
    __block int count=0;
    
    for (UIView *v in animSubViews) {
        
        if (!animation) {
            v.layer.transform=transform;
        }else{
            [UIView animateWithDuration:.5 delay:delay
                 usingSpringWithDamping:.5 initialSpringVelocity:0.2f
                                options:0 animations:^{
                                    v.layer.transform=transform;
                                } completion:^(BOOL finished) {
                                    count++;
                                    if (count==animSubViews.count) {
                                        runningAnim=NO;
                                    }
                                }];
            delay+=0.06;
        }
    }
}

-(void)setViewsOutAndIn
{
    [self setViewsInOrOut:NO anim:NO];
    [self setViewsInOrOut:YES anim:YES];
    
}

-(void)setViewsInAndOut
{
    if (runningAnim) {
        return;
    }
    runningAnim=YES;
    [self setViewsInOrOut:YES anim:NO];
    [self setViewsInOrOut:NO anim:YES];
}

@end
