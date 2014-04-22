//
//  GameViewController.m
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "BeginnerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BeginnerViewController ()

@end

@implementation BeginnerViewController

@synthesize timeLabel, score, minus1, minus10, minus100, minus1000, prompt, resetButton, best;

double elapsed;
static int count = 0;


- (BOOL)newHighScore {
    if(elapsed < [[NSUserDefaults standardUserDefaults] doubleForKey: @"beginnerHighScore"]) {
        [[NSUserDefaults standardUserDefaults] setDouble:elapsed forKey:@"beginnerHighScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if([[NSUserDefaults standardUserDefaults] doubleForKey:@"beginnerHighScore"] != 99999)
        best.text = [NSString stringWithFormat:@"%.03f", [[NSUserDefaults standardUserDefaults] doubleForKey:@"beginnerHighScore"]];
    else
        best.text = @"NA";
    self.view.backgroundColor = [UIColor blackColor];
    resetButton.hidden = true;
    resetButton.enabled = false;
    resetButton.layer.cornerRadius = 10;
    resetButton.clipsToBounds = YES;
    minus1.enabled = true;
    minus10.enabled = true;
    minus100.enabled = true;
    minus1000.enabled = true;
    minus1.layer.cornerRadius = 10;
    minus1.clipsToBounds = YES;
    minus10.layer.cornerRadius = 10;
    minus10.clipsToBounds = YES;
    minus100.layer.cornerRadius = 10;
    minus100.clipsToBounds = YES;
    minus1000.layer.cornerRadius = 10;
    minus1000.clipsToBounds = YES;
    prompt.text = @"Press a button to begin...";
    elapsed = 0.00;
    timeLabel.text = [NSString stringWithFormat:@"%.3f", elapsed];
    running = false;
    [self randomInteger];
}

- (void)startGame {
    if(running)
        return;
    else {
        [self start];
        prompt.text = @"";
        running = true;
        resetButton.hidden = false;
        resetButton.enabled = true;
    }
}

- (void) randomInteger {
    while (true) {
        count = arc4random_uniform(5000) + 5000;
        NSString *countString = [NSString stringWithFormat:@"%i", count];
        if([countString rangeOfString:@"0"].location == NSNotFound && [countString rangeOfString:@"1"].location == NSNotFound && [countString rangeOfString:@"2"].location == NSNotFound && [countString rangeOfString:@"3"].location == NSNotFound) {
            score.text = countString;
            break;
        }
    }
}

- (IBAction)minus1000:(id)sender {
    [self startGame];
    count -= 1000;
    score.text = [NSString stringWithFormat:@"%i", count];
    [self didWin];
}

- (IBAction)minus100:(id)sender {
    [self startGame];
    count -= 100;
    score.text = [NSString stringWithFormat:@"%i", count];
    [self didWin];
}

- (IBAction)minus10:(id)sender {
    [self startGame];
    count -= 10;
    score.text = [NSString stringWithFormat:@"%i", count];
    [self didWin];
}

- (IBAction)minus1:(id)sender {
    [self startGame];
    count -= 1;
    score.text = [NSString stringWithFormat:@"%i", count];
    [self didWin];
}

- (IBAction)reset:(id)sender {
    [self viewDidLoad];
}
- (void)didWin {
    if(count == 0) {
        [self stop];
        self.view.backgroundColor = [UIColor greenColor];
        if([self newHighScore]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"New High Score!" message:[NSString stringWithFormat:@"You set a new highscore with a time of %.3f seconds!", elapsed] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
            [alert show];
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Win" message:[NSString stringWithFormat:@"Yay, you won with a time of %.3f seconds", elapsed] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
            [alert show];
        }
        
    }
    else if(count < 0) {
        [self stop];
        self.view.backgroundColor = [UIColor redColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lost" message:@"Whoops, you went below zero" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)start {
    running = true;
    startTime = [NSDate timeIntervalSinceReferenceDate];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while(running) {
            [self performSelectorOnMainThread:@selector(updateTime) withObject:nil waitUntilDone:false];
            [NSThread sleepForTimeInterval:.01f];
        }
    });
}

- (void)stop {
    running = false;
    minus1.enabled = false;
    minus10.enabled = false;
    minus100.enabled = false;
    minus1000.enabled = false;
}
- (void)updateTime {
    if(!running)
        return;
    else {
        if(elapsed > 1000) {
            [self stop];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lost" message:@"Whoops, you took way too long" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
            [alert show];
        } else {
            NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
            elapsed = (double) currentTime - startTime;
            timeLabel.text = [NSString stringWithFormat:@"%.3f", elapsed];
        }
    }
}
-(void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0){
        [self viewDidLoad];
    }
}
@end
