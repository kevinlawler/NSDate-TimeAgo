//
//  ViewController2ViewController.h
//  NSDate-TimeAgoDemo
//
//  Created by Chris Greenwood on 5/17/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+TimeAgo.h"

@interface ViewController2ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *GRANULARITY_STRINGS;
    TimeAgoGranularity granularity;
}
@property (strong, nonatomic) NSDate *date;
@property (weak, nonatomic) IBOutlet UIPickerView *granularityPicker;
- (IBAction)displayPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

@end
