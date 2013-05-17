//
//  ViewController.h
//  NSDate-TimeAgoDemo
//
//  Created by Chris Greenwood on 5/17/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2ViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)nextPressed:(id)sender;

@end
