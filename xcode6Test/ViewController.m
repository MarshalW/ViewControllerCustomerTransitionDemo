//
//  ViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-8-31.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//


#define SCREEN_WIDTH [ [ UIScreen mainScreen ] bounds ].size.width

#import "ViewController.h"

@interface ViewController ()

{
    BOOL opened;
    
    __weak IBOutlet NSLayoutConstraint *contentLeftSpaceConstraints;
    __weak IBOutlet NSLayoutConstraint *contentRightSpaceConstraint;
    
    __weak IBOutlet UIView *contentView;
    
    float constant;
    
    CGPoint originalPoint, leftPoint;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    originalPoint=contentView.center;
    leftPoint=CGPointMake(originalPoint.x+320,originalPoint.y);
}

- (IBAction)updateContraints:(id)sender {
    [contentView updateConstraints];
    [contentView layoutIfNeeded];
}


- (IBAction)contentAnim:(id)sender {
    
//    if (!opened) {
//        contentLeftSpaceConstraints.constant+= SCREEN_WIDTH;
//        contentRightSpaceConstraint.constant-=SCREEN_WIDTH;
//    }else{
//        contentLeftSpaceConstraints.constant= 17;
//        contentRightSpaceConstraint.constant=18;
//    }
//    
//    opened=!opened;
    
//    [UIView animateWithDuration:.5 animations:^{
//        [contentView layoutIfNeeded];
//    }];
    
    
   
    
    [UIView animateWithDuration:.5 delay:0
         usingSpringWithDamping:.6 initialSpringVelocity:0.1f
                        options:0 animations:^{
//                            [contentView layoutIfNeeded];
//                            contentView.center=CGPointMake(320*2,260);
                            
                            if (!opened) {
//                                contentView.center=CGPointMake(320*2,260);
                                contentView.center=leftPoint;
                            }else{
                                contentView.center=originalPoint;
                            }
                            
                            opened=!opened;
                            
                        } completion:nil];
    
    
    // use calayer animation
    
//    CABasicAnimation* fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    fadeAnim.fromValue = [NSNumber numberWithFloat:1.0];
//    fadeAnim.toValue = [NSNumber numberWithFloat:0.0];
//    fadeAnim.duration = 1.0;
    
//    if (!opened) {
//            contentView.layer.opacity=0;
//    }else{
//            contentView.layer.opacity=1;
//    }
    
//    [contentView.layer addAnimation:fadeAnim forKey:@"opacity"];
    

//    opened=!opened;
}

@end
