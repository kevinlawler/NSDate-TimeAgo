@interface NSDate (TimeAgo)
- (NSString *) timeAgo;
- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit;
- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit dateFormat:(NSDateFormatterStyle)dFormatter andTimeFormat:(NSDateFormatterStyle)tFormatter;
- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit dateFormatter:(NSDateFormatter *)formatter;


// this method only returns "{value} {unit} ago" strings and no "yesterday"/"last month" strings
- (NSString *)dateTimeAgo;

// this method gives when possible the date compared to the current calendar date: "this morning"/"yesterday"/"last week"/..
// when more precision is needed (= less than 6 hours ago) it returns the same output as dateTimeAgo
- (NSString *)dateTimeUntilNow;


// shows how many days are left in the future.
// ex: 3 days left
- (NSString *)daysLeft;

//if you would like a custom ending to the days left method
// ex: 3 days remaining, pass in @"days remaining"
- (NSString *)daysLeftWithEnding:(NSString *)ending;


@end

