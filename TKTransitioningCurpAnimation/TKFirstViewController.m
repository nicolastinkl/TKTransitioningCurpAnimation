//
//  TKFirstViewController.m
//  TKTransitioningCurpAnimation
//
//  Created by tinkl on 9/5/14.
//  Copyright (c) 2014 ___TINKL___. All rights reserved.
//

#import "TKFirstViewController.h"

#define ios7BlueColor             [UIColor colorWithRed:0.188 green:0.655 blue:1.000 alpha:1.000]

@interface TKFirstViewController ()

@end

@implementation TKFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"title %lu",(unsigned long)self.navigationController.viewControllers.count];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(80.0, 180.0, 160.0, 40.0);
    
    button.layer.cornerRadius = 3;
    button.layer.masksToBounds = YES;
    
    button.layer.borderWidth = 1;
    button.layer.borderColor = [ios7BlueColor CGColor];
  
    
    [button setTitle:@"push me" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(IBAction)buttonClicked:(id)sender
{
    TKFirstViewController * view = [[TKFirstViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
