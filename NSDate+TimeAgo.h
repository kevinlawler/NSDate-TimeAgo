
enum TimeAgoGranularity {
    TimeAgoGranularitySeconds,
    TimeAgoGranularityMinutes,
    TimeAgoGranularityHours,
    TimeAgoGranularityDays,
    TimeAgoGranularityWeeks,
    TimeAgoGranularityMonths,
    TimeAgoGranularityYears,
};
typedef enum TimeAgoGranularity TimeAgoGranularity;

@interface NSDate (TimeAgo)
- (NSString *) timeAgo;
- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit;
- (NSString *) timeAgoWithLimit:(NSTimeInterval)limit dateFormat:(NSDateFormatterStyle)dFormatter andTimeFormat:(NSDateFormatterStyle)tFormatter;
- (NSString *) timeAgoWithGranularity:(TimeAgoGranularity)granularity;
@end

