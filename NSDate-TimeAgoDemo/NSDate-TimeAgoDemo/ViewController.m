//
//  ViewController.m
//  NSDate-TimeAgoDemo
//
//  Created by Chris Greenwood on 5/17/13.
//  Copyright (c) 2013 Chris Greenwood. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+TimeAgo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDate *date = [NSDate date];
    NSLog(@"%@", [date timeAgo]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPressed:(id)sender {
    ViewController2ViewController *vc = [[ViewController2ViewController alloc] init];
    vc.date = self.datePicker.date;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
