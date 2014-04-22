//
//  ScoresViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/22/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "ScoresViewController.h"

@interface ScoresViewController ()

@end

@implementation ScoresViewController

@synthesize beginner, intermediate, expert;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if([[NSUserDefaults standardUserDefaults] doubleForKey:@"beginnerHighScore"] != 99999)
        beginner.text = [NSString stringWithFormat:@"Beginner: %.03f", [[NSUserDefaults standardUserDefaults] doubleForKey:@"beginnerHighScore"]];
    else
        beginner.text = @"Beginner: NA";
    if([[NSUserDefaults standardUserDefaults] doubleForKey:@"intermediateHighScore"] != 99999)
        intermediate.text = [NSString stringWithFormat:@"Intermediate: %.03f", [[NSUserDefaults standardUserDefaults] doubleForKey:@"intermediateHighScore"]];
    else
        intermediate.text = @"Intermediate: NA";
    if([[NSUserDefaults standardUserDefaults] doubleForKey:@"expertHighScore"] != 99999)
        expert.text = [NSString stringWithFormat:@"Expert: %.03f", [[NSUserDefaults standardUserDefaults] doubleForKey:@"expertHighScore"]];
    else
        expert.text = @"Expert: NA";
}

@end
