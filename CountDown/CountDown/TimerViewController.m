//
//  TimerViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController
double myTime = 0.00;
bool keepGoing = true;

@synthesize timeLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    timeLabel.text = [NSString stringWithFormat:@"%.2f", myTime];
}

- (IBAction)startTime:(id)sender {
    keepGoing = true;
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while(keepGoing) {
            myTime = myTime + .01;
            [NSThread sleepForTimeInterval:.01f];
            dispatch_async( dispatch_get_main_queue(), ^{
                timeLabel.text = [NSString stringWithFormat:@"%.2f", myTime];
            });
            
        }
    });
}

- (IBAction)stopTime:(id)sender {
    keepGoing = false;
}

- (IBAction)resetTime:(id)sender {
    myTime = 0.00;
    timeLabel.text = [NSString stringWithFormat:@"%.2f", myTime];
}
@end
