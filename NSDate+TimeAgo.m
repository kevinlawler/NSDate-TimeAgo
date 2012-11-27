#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)

#ifndef NSDateTimeAgoLocalizedStrings
#define NSDateTimeAgoLocalizedStrings(key) \
    NSLocalizedStringFromTable(key, @"NSDateTimeAgo", nil)
#endif

- (NSString *)timeAgo 
{
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;
    
    if(deltaSeconds < 5) {
        return NSDateTimeAgoLocalizedStrings(@"Just now");
    } else if(deltaSeconds < 60) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d seconds ago"), (int)deltaSeconds];
    } else if(deltaSeconds < 120) {
        return NSDateTimeAgoLocalizedStrings(@"A minute ago");
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d minutes ago"), (int)deltaMinutes];
    } else if (deltaMinutes < 120) {
        return NSDateTimeAgoLocalizedStrings(@"An hour ago");
    } else if (deltaMinutes < (24 * 60)) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d hours ago"), (int)floor(deltaMinutes/60)];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return NSDateTimeAgoLocalizedStrings(@"Yesterday");
    } else if (deltaMinutes < (24 * 60 * 7)) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d days ago"), (int)floor(deltaMinutes/(60 * 24))];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return NSDateTimeAgoLocalizedStrings(@"Last week");
    } else if (deltaMinutes < (24 * 60 * 31)) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d weeks ago"), (int)floor(deltaMinutes/(60 * 24 * 7))];
    } else if (deltaMinutes < (24 * 60 * 61)) {
        return NSDateTimeAgoLocalizedStrings(@"Last month");
    } else if (deltaMinutes < (24 * 60 * 365.25)) {
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d months ago"), (int)floor(deltaMinutes/(60 * 24 * 30))];
    } else if (deltaMinutes < (24 * 60 * 731)) {
        return NSDateTimeAgoLocalizedStrings(@"Last year");
    }

    return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d years ago"), (int)floor(deltaMinutes/(60 * 24 * 365))];
}

- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit
{
    return [self timeAgoWithLimit:limit dateFormat:NSDateFormatterFullStyle andTimeFormat:NSDateFormatterFullStyle];
}

- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit dateFormat:(NSDateFormatterStyle)dFormatter andTimeFormat:(NSDateFormatterStyle)tFormatter
{
    if (fabs([self timeIntervalSinceDate:[NSDate date]]) <= limit)
        return [self timeAgo];
    
    return [NSDateFormatter localizedStringFromDate:self
                                          dateStyle:dFormatter
                                          timeStyle:tFormatter];
}

@end
