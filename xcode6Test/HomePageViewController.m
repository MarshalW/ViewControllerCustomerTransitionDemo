//
//  HomePageViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-3.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageNextStepViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)nextStep:(id)sender {
    NSLog(@"navigation controller: %@",self.navigationController);
    
    HomePageNextStepViewController *controller=[[HomePageNextStepViewController alloc] initWithNibName:@"HomePageNextStepViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
