//
//  AppDelegate.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-8-31.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "AppDelegate.h"

//#import "ViewController.h"
//#import "LoginViewController.h"
//#import "LoginFormViewController.h"

//#import "HomeViewController.h"

#import "ContainerViewController.h"
#import "NavigationControllerDelegate.h"

@interface AppDelegate ()

{
    NavigationControllerDelegate *naviDelegate;
}

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
//    ViewController *controller=[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
//    LoginFormViewController *controller=[[LoginFormViewController alloc] initWithNibName:@"LoginFormViewController" bundle:nil];
    
//     HomeViewController *controller=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
//    
//    UINavigationController *naviController=[[UINavigationController alloc] initWithRootViewController:controller];
//    naviController.navigationBar.hidden = YES;
//    self.window.rootViewController=naviController;
//    [self.window addSubview:naviController.view];
    
    ContainerViewController *controller=[[ContainerViewController alloc] initWithNibName:@"ContainerViewController" bundle:nil];
    
    UINavigationController *naviController=[[UINavigationController alloc] initWithRootViewController:controller];
    naviController.navigationBar.hidden = YES;
    naviDelegate=[[NavigationControllerDelegate alloc] init];
    naviController.delegate=naviDelegate;
    
    self.window.rootViewController=naviController;
    
    return YES;
}


@end
