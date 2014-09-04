//
//  HomePageNextStepViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-4.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomePageNextStepViewController.h"

@interface HomePageNextStepViewController ()

@end

@implementation HomePageNextStepViewController

- (IBAction)goBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
