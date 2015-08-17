//
//  SecondViewController.m
//  EmptyStateView
//
//  Created by admin on 14/08/15.
//  Copyright (c) 2015 orafaelreis. All rights reserved.
//

#import "CarViewController.h"
#import "EmptyStateView.h"

@interface CarViewController ()

@property(nonatomic, strong) EmptyStateView *defaultView;

@end

@implementation CarViewController

@synthesize defaultView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Cars";
    
    NSInteger nOfItems = 0;//hard coding the empty state
    
    if (nOfItems == 0) {
        defaultView = [[EmptyStateView alloc] initWithFrame:self.view.frame];
        [defaultView addTitle:@"There is no Cars"];
        [defaultView addImage:[UIImage imageNamed:@"empty-state-cars"] withDistance:10.f];
        [defaultView addDescription:@"You will need create at least one car. \n Click Here to create!" withDistance:20.f];
        
        [defaultView addOneTapGestureWithTarget:self action:@selector(loadNextViewController)];
        [self.view addSubview: defaultView];
    }
}


- (void)loadNextViewController{
    UIViewController *nextVC = [[UIViewController alloc] init];
    nextVC.title = @"Create Car";
    nextVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
