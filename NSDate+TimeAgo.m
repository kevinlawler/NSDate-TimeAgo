#import "NSDate+TimeAgo.h"

@interface NSDate()
-(NSString *)getLocaleFormatUnderscoresWithValue:(double)value;
@end

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
    
    int minutes;
    NSString *localeFormat;

    if(deltaSeconds < 5)
    {
        return NSDateTimeAgoLocalizedStrings(@"Just now");
    }
    else if(deltaSeconds < 60)
    {
        localeFormat = [NSString stringWithFormat:@"%%d %@seconds ago", [self getLocaleFormatUnderscoresWithValue:(int)deltaSeconds]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), (int)deltaSeconds];
    }
    else if(deltaSeconds < 120)
    {
        return NSDateTimeAgoLocalizedStrings(@"A minute ago");
    }
    else if (deltaMinutes < 60)
    {
        localeFormat = [NSString stringWithFormat:@"%%d %@minutes ago", [self getLocaleFormatUnderscoresWithValue:(int)deltaMinutes]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), (int)deltaMinutes];
    }
    else if (deltaMinutes < 120)
    {
        return NSDateTimeAgoLocalizedStrings(@"An hour ago");
    }
    else if (deltaMinutes < (24 * 60))
    {
        minutes = (int)floor(deltaMinutes/60);
        localeFormat = [NSString stringWithFormat:@"%%d %@hours ago", [self getLocaleFormatUnderscoresWithValue:minutes]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), minutes];
    }
    else if (deltaMinutes < (24 * 60 * 2))
    {
        return NSDateTimeAgoLocalizedStrings(@"Yesterday");
    }
    else if (deltaMinutes < (24 * 60 * 7))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24));
        localeFormat = [NSString stringWithFormat:@"%%d %@days ago", [self getLocaleFormatUnderscoresWithValue:minutes]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), minutes];
    }
    else if (deltaMinutes < (24 * 60 * 14))
    {
        return NSDateTimeAgoLocalizedStrings(@"Last week");
    }
    else if (deltaMinutes < (24 * 60 * 31))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24 * 7));
        localeFormat = [NSString stringWithFormat:@"%%d %@weeks ago", [self getLocaleFormatUnderscoresWithValue:minutes]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), minutes];
    }
    else if (deltaMinutes < (24 * 60 * 61))
    {
        return NSDateTimeAgoLocalizedStrings(@"Last month");
    }
    else if (deltaMinutes < (24 * 60 * 365.25))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24 * 30));
        localeFormat = [NSString stringWithFormat:@"%%d %@months ago", [self getLocaleFormatUnderscoresWithValue:minutes]];
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), minutes];
    }
    else if (deltaMinutes < (24 * 60 * 731))
    {
        return NSDateTimeAgoLocalizedStrings(@"Last year");
    }

    minutes = (int)floor(deltaMinutes/(60 * 24 * 365));
    localeFormat = [NSString stringWithFormat:@"%%d %@years ago", [self getLocaleFormatUnderscoresWithValue:minutes]];
    return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(localeFormat), minutes];
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

// Helper functions

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

/*
 - Author  : Almas Adilbek
 - Method  : getLocaleFormatUnderscoresWithValue
 - Param   : value (Double value of seconds or minutes)
 - Return  : @"" or the set of underscores ("_")
             in order to define exact translation format for specific translation rules.
             (Ex: "%d _seconds ago" for "%d секунды назад", "%d __seconds ago" for "%d секунда назад",
             and default format without underscore %d seconds ago" for "%d секунд назад")
   Updated : 12/12/2012
 
   Note    : This method must be used for all languages that have specific translation rules. 
             Using method argument "value" you must define all possible conditions language have for translation 
             and return set of underscores ("_") as it is an ID for locale format. No underscore ("") means default locale format;
 */
-(NSString *)getLocaleFormatUnderscoresWithValue:(double)value
{
    NSString *localeCode = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    // Russian (ru)
    if([localeCode isEqual:@"ru"]) {
        NSString *valueStr = [NSString stringWithFormat:@"%.f", value];
        int l = valueStr.length;
        int XY = [[valueStr substringWithRange:NSMakeRange(l - 2, l)] intValue];
        int Y = (int)floor(value) % 10;
        
        if(Y == 0 || Y > 4 || XY == 11) return @"";
        if(Y != 1 && Y < 5)             return @"_";
        if(Y == 1)                      return @"__";
    }
    
    // Add more languages here, which are have specific translation rules...
    
    return @"";
}

#pragma clang diagnostic pop

@end
