//
//  GameViewController.h
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeginnerViewController : UIViewController {
    bool running;
    NSTimeInterval startTime;
}
@property (weak, nonatomic) IBOutlet UILabel *score;
- (IBAction)minus1000:(id)sender;
- (IBAction)minus100:(id)sender;
- (IBAction)minus10:(id)sender;
- (IBAction)minus1:(id)sender;
- (IBAction)reset:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *prompt;
@property (weak, nonatomic) IBOutlet UIButton *minus1;
@property (weak, nonatomic) IBOutlet UIButton *minus10;
@property (weak, nonatomic) IBOutlet UIButton *minus100;
@property (weak, nonatomic) IBOutlet UIButton *minus1000;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
