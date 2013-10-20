//
//  AAViewController.h
//  RomanClock
//
//  Created by Kyle Oba on 10/15/13.
//  Copyright (c) 2013 Kyle Oba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAClockHandsView.h"
@interface AAViewController : UIViewController

- (void)tick: (CADisplayLink *)sender;
@end
