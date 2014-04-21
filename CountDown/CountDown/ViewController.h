//
//  ViewController.h
//  CountDown
//
//  Created by David Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)minus:(UIButton *)sender;
- (IBAction)plus:(UIButton *)sender;
- (IBAction)minus10:(UIButton *)sender;
- (IBAction)plus10:(UIButton *)sender;
- (IBAction)minus100:(UIButton *)sender;
- (IBAction)plus100:(UIButton *)sender;
- (IBAction)minus1000:(UIButton *)sender;
- (IBAction)plus1000:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *counter;


@end
