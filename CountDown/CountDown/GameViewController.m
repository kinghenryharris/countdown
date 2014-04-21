//
//  GameViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

@synthesize timeLabel;

double elapsed;

- (void)viewDidLoad {
    [super viewDidLoad];
    elapsed = 0.00;
    timeLabel.text = [NSString stringWithFormat:@"%.2f", elapsed];
    running = false;
}

- (IBAction)start:(id)sender {
    running = true;
    startTime = [NSDate timeIntervalSinceReferenceDate];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while(running) {
            [self performSelectorOnMainThread:@selector(updateTime) withObject:nil waitUntilDone:false];
            [NSThread sleepForTimeInterval:.01f];
        }
    });
}

- (IBAction)stop:(id)sender {
    running = false;
}

- (IBAction)reset:(id)sender {
    elapsed = 0.00;
    timeLabel.text = [NSString stringWithFormat:@"%.2f", elapsed];
}
- (void)updateTime {
    if(!running)
        return;
    else {
        NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
        elapsed = (double) currentTime - startTime;
        timeLabel.text = [NSString stringWithFormat:@"%.2f", elapsed];
    }
}
@end
