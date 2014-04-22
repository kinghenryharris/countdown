//
//  PlayViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/22/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

@synthesize beginner, intermediate, expert;

- (void)viewDidLoad {
    [super viewDidLoad];
    beginner.layer.cornerRadius = 10;
    beginner.clipsToBounds = YES;
    intermediate.layer.cornerRadius = 10;
    intermediate.clipsToBounds = YES;
    expert.layer.cornerRadius = 10;
    expert.clipsToBounds = YES;
}

@end
