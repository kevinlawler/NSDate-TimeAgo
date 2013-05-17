//
//  ViewController2ViewController.m
//  NSDate-TimeAgoDemo
//
//  Created by Chris Greenwood on 5/17/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "ViewController2ViewController.h"

@implementation ViewController2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        GRANULARITY_STRINGS = @[@"Seconds", @"Minutes", @"Hours", @"Days", @"Weeks", @"Months", @"Years"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.granularityPicker.dataSource = self;
    self.granularityPicker.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayPressed:(id)sender {
    
    NSString *dateString = [self.date timeAgoWithGranularity:granularity];
    self.resultsLabel.text = dateString;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [GRANULARITY_STRINGS objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    granularity = row;
}



@end
