//
//  AAViewController.m
//  RomanClock
//
//  Created by Kyle Oba on 10/15/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import "AAViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "AAClockHandsView.h"

@interface AAViewController ()
@property (strong, nonatomic)CADisplayLink *displayLink;
@end

@implementation AAViewController

- (void)tick: (CADisplayLink *)sender
{
    NSCalendar *cal = [ [NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *dateComps = [cal components:NSSecondCalendarUnit fromDate:now];
    
    NSLog(@"seconds: %i", [dateComps second]);
    [self drawHourHandForDegree:-[dateComps second]];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"hello world");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    self.displayLink.frameInterval = 30;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.displayLink invalidate];
    self.displayLink = nil;
}


@end
