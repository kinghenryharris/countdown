//
//  TimerViewController.h
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController
- (IBAction)startTime:(id)sender;
- (IBAction)stopTime:(id)sender;
- (IBAction)resetTime:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) NSTimer *timer;

@end
