//
//  LoginViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-1.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

{
    NSArray * originPoints;
    
    IBOutletCollection(UIView) NSArray *subViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view did load");
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
//    [self setInitCenter];
//    for (UIView *v in subViews) {
//        v.center=CGPointMake(-320, v.center.y);
//    }
    
    self.view.center=CGPointMake(-320, self.view.center.y);

}

-(void)setInitCenter
{
    NSMutableArray *points=[[NSMutableArray alloc] init];
    
    for (UIView *v in subViews) {
        [points addObject:[NSValue valueWithCGPoint:v.center]];
        [UIView animateWithDuration:0 delay:0
             usingSpringWithDamping:.6 initialSpringVelocity:0.1f
                            options:0 animations:^{
                                v.center=CGPointMake(-320*2, v.center.y);
                            } completion:nil];
    }
    
}


-(void)setDelayAnim:(NSTimer *)timer
{
    NSMutableArray *points=[[NSMutableArray alloc] init];
    float delay=0.5;
    
    for (UIView *v in subViews) {
        [points addObject:[NSValue valueWithCGPoint:v.center]];
        NSLog(@"v: %@",v);
        
        
        [UIView animateWithDuration:.5 delay:delay
             usingSpringWithDamping:.6 initialSpringVelocity:0.1f
                            options:0 animations:^{
                                v.center=CGPointMake(v.center.x-320, v.center.y);
                            } completion:nil];
        delay+=0.1;
    }

}

@end
