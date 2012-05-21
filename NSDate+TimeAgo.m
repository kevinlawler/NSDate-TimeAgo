#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)


-(NSString *)timeAgo {
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;
    
    if(deltaSeconds < 5) {
        return NSLocalizedString(@"Just now", nil);
    } else if(deltaSeconds < 60) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d seconds ago", nil), (int)deltaSeconds];
    } else if(deltaSeconds < 120) {
        return NSLocalizedString(@"A minute ago", nil);
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d minutes ago", nil), (int)deltaMinutes];
    } else if (deltaMinutes < 120) {
        return NSLocalizedString(@"An hour ago", nil);
    } else if (deltaMinutes < (24 * 60)) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d hours ago", nil), (int)floor(deltaMinutes/60)];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return NSLocalizedString(@"Yesterday", nil);
    } else if (deltaMinutes < (24 * 60 * 7)) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d days ago", nil), (int)floor(deltaMinutes/(60 * 24))];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return NSLocalizedString(@"Last week", nil);
    } else if (deltaMinutes < (24 * 60 * 31)) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d weeks ago", nil), (int)floor(deltaMinutes/(60 * 24 * 7))];
    } else if (deltaMinutes < (24 * 60 * 61)) {
        return NSLocalizedString(@"Last month", nil);
    } else if (deltaMinutes < (24 * 60 * 365.25)) {
        return [NSString stringWithFormat:NSLocalizedString(@"%d months ago", nil), (int)floor(deltaMinutes/(60 * 24 * 30))];
    } else if (deltaMinutes < (24 * 60 * 731)) {
        return NSLocalizedString(@"Last year", nil);
    }
    return [NSString stringWithFormat:NSLocalizedString(@"%d years ago", nil), (int)floor(deltaMinutes/(60 * 24 * 365))];
}

@end
