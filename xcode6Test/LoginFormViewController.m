//
//  LoginFormViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-2.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "LoginFormViewController.h"
#import "LoginFormView.h"

@interface LoginFormViewController ()

{
    IBOutlet LoginFormView *contentView;
    IBOutletCollection(UIView) NSArray *contentSubViews;
    
    BOOL isOk;
}

@end

@implementation LoginFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:contentView];
}

- (void)viewDidLayoutSubviews
{
//    if (isOk) {
//        return;
//    }
//    isOk=YES;
//    [contentView setViewsOutAndIn];
    [contentView setViewsInAndOut];
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    NSLog(@"update view constraints");
}


@end
