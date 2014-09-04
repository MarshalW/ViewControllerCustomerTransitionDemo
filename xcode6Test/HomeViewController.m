//
//  HomeViewController.m
//  xcode6Test
//
//  Created by Marshal Wu on 14-9-3.
//  Copyright (c) 2014年 Marshal Wu. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"

@interface HomeViewController ()
{
    
//    IBOutletCollection(UIView) NSArray *shakeViews;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//-(void)viewDidAppear:(BOOL)animated
//{
//    float delay=0.5;
//    int offset=20;
//    
//    for (UIView *v in shakeViews) {
//        v.center=CGPointMake(v.center.x-offset, v.center.y);
//        
//        [UIView animateWithDuration:.5 delay:delay
//             usingSpringWithDamping:.5 initialSpringVelocity:0.1f
//                            options:0 animations:^{
//                                v.center=CGPointMake(v.center.x+offset, v.center.y);
//                            } completion:nil];
//        delay+=0.1;
//
//    }
//}


- (IBAction)submit:(id)sender {
    DetailViewController *detailViewController=[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:NO];
}


@end
