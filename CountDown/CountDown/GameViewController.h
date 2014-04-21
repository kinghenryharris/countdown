//
//  GameViewController.h
//  CountDown
//
//  Created by Henry Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController {
    bool running;
    NSTimeInterval startTime;
}
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
- (IBAction)reset:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end
