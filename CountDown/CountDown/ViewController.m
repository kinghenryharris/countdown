//
//  ViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scores, play;

- (void)viewDidLoad {
    [super viewDidLoad];
    play.layer.cornerRadius = 10;
    play.clipsToBounds = YES;
    scores.layer.cornerRadius = 10;
    scores.clipsToBounds = YES;
}

@end
