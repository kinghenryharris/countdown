//
//  ViewController.m
//  CountDown
//
//  Created by David Harris on 4/21/14.
//  Copyright (c) 2014 Dummy Code. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize counter;

int count = 0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    counter.text = [NSString stringWithFormat:@"%i", count];
    self.view.backgroundColor = [UIColor blackColor];
}
- (IBAction)minus:(id)sender {
    count = count - 1;
    counter.text = [NSString stringWithFormat:@"%i", count];
}

- (IBAction)plus:(id)sender {
    count = count + 1;
    counter.text = [NSString stringWithFormat:@"%i",  count];
}

- (IBAction)plus10:(id)sender {
    count = count + 10;
    counter.text = [NSString stringWithFormat:@"%i",  count];
}

- (IBAction)minus10:(id)sender {
    count = count - 10;
    counter.text = [NSString stringWithFormat:@"%i",  count];
}

- (IBAction)minus100:(id)sender {
    count = count - 100;
    counter.text = [NSString stringWithFormat:@"%i", count];
}

- (IBAction)plus100:(id)sender {
    count = count + 100;
    counter.text = [NSString stringWithFormat:@"%i",  count];
}

- (IBAction)minus1000:(id)sender {
    count = count - 1000;
    counter.text = [NSString stringWithFormat:@"%i", count];
}
- (IBAction)plus1000:(id)sender {
        count = count - 1000;
        counter.text = [NSString stringWithFormat:@"%i", count];
}
 @end