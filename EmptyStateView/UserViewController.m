//
//  FirstViewController.m
//  EmptyStateView
//
//  Created by admin on 14/08/15.
//  Copyright (c) 2015 orafaelreis. All rights reserved.
//

#import "UserViewController.h"
#import "EmptyStateView.h"

@interface UserViewController ()<UIAlertViewDelegate>

@property(nonatomic, strong) EmptyStateView *defaultView;

@end

@implementation UserViewController

@synthesize defaultView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger nOfItems = 0;//hard coding the empty state
    
    if (nOfItems == 0) {
        defaultView = [[EmptyStateView alloc] initWithFrame:self.view.frame];
        [defaultView setTitle:@"There is no Users"];
        [defaultView setDescription:@"You will need create at least one user. \n Click Here to create!"];
        [defaultView setStateImage:[UIImage imageNamed:@"empty-state-is-empty"]];
        [defaultView addOneTapGestureWithTarget:self action:@selector(createUser)];
        [self.view addSubview: defaultView];
    }
    
}

- (void)createUser{
    UIAlertView *alertView;
    alertView = [[UIAlertView alloc] initWithTitle:@"Sucesso" message:@"You created the user!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    
    [alertView show];
}

#pragma mark - UIALertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [defaultView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
