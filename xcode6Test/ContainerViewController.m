//
//  ContainerViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-3.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "ContainerViewController.h"
#import "HomePageViewController.h"
#import "ChatListViewController.h"
#import "SettingsViewController.h"


@interface ContainerViewController ()
{
    __weak IBOutlet UIView *menuView;
    __weak IBOutlet UIView *contentView;
//    int currentControllerIndex;
}



@end

@implementation ContainerViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    [self initChildrenControllers];
    
    [contentView addSubview:[self currentViewController].view];
    self.currentControllerIndex=0;
    [self _runSubviewsAnim:YES controller:[self currentViewController] duration:.5f];
}

-(UIViewController *) currentViewController
{
    return [self.childViewControllers objectAtIndex:self.currentControllerIndex];
}

-(void) initChildrenControllers
{
    HomePageViewController *homePageViewController=[[HomePageViewController alloc] initWithNibName:@"HomePageViewController" bundle:nil];
    [self addChildViewController:homePageViewController];
    [homePageViewController didMoveToParentViewController:self];
    
    ChatListViewController *charListViewController=[[ChatListViewController alloc] initWithNibName:@"ChatListViewController" bundle:nil];
    [self addChildViewController:charListViewController];
    [charListViewController didMoveToParentViewController:self];
    
    SettingsViewController *settingsViewController=[[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self addChildViewController:settingsViewController];
    [settingsViewController didMoveToParentViewController:self];
}

-(void)viewWillAppear:(BOOL)animated
{
//    [contentView addSubview:[self currentViewController].view];
//    currentControllerIndex=0;
//    [self _runSubviewsAnim:YES controller:[self currentViewController] duration:.5f];
}


- (IBAction)gotoHomePage:(id)sender {
    NSLog(@"goto home page");
    [self _switchController:0];
}

- (IBAction)gotoChatList:(id)sender {
    NSLog(@"got chat list");
    [self _switchController:1];
}

- (IBAction)gotoSetting:(id)sender {
    NSLog(@"got settings %@",[self.childViewControllers objectAtIndex:2]);
    [self _switchController:2];
}

-(void)_switchController:(int)index
{
    UIViewController *currentController=[self currentViewController];
    UIViewController *controller=[self.childViewControllers objectAtIndex:index];
    
    if (currentController!=controller) {
        
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height;
        
        float duration=.5f;
        
        //两个child controller的切换，但只处理移出的view动画
        [self transitionFromViewController:[self currentViewController] toViewController:controller duration:duration-.35f options:UIViewAnimationOptionTransitionNone animations:^{
            currentController.view.frame= CGRectMake(0 - width, 0, width, height);
        }completion:^(BOOL finished) {
            if (finished) {
                currentController.view.frame= CGRectMake(0, 0, width, height);
                [currentController.view removeFromSuperview];
                self.currentControllerIndex=index;
            }
        }];
        
        //移入视图的动画
        [self _runSubviewsAnim:index>self.currentControllerIndex controller:controller duration:duration];
        
    }
}

-(void)_runSubviewsAnim:(BOOL)forward controller:(UIViewController *)_controller duration:(float)_duration
{
    float delay=0.f;
    int offset=400;
    
    if (!forward) {
        offset=-offset;
    }
        for (UIView *v in _controller.view.subviews) {
//    for (UIView *v in ((UINavigationController *)_controller).topViewController.view.subviews) {
        v.center=CGPointMake(v.center.x+offset, v.center.y);
        
        [UIView animateWithDuration:_duration delay:delay
             usingSpringWithDamping:.7 initialSpringVelocity:10
                            options:0 animations:^{
                                v.center=CGPointMake(v.center.x-offset, v.center.y);
                            } completion:^(BOOL finished){
                            }];
        delay+=.05f;
    }
}

@end




