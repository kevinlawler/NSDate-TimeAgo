## Description

This is an iOS, Objective-C, Cocoa Touch, iPhone, iPad category for NSDate. It gives NSDate the ability to report times like "A moment ago", "30 seconds ago", "5 minutes ago", "Yesterday", "Last Month", "2 Years Ago", and so on.

This functionality has variously been referred to as a "time ago", "time since", or "fuzzy date" feature.

## Use

1.  Add the files to your project
2.  Import the header using  `#import "NSDate+TimeAgo.h"`
3.  Call the `timeAgo` method in the following way:

<pre>
NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:0]
NSString *ago = [date timeAgo];
NSLog(@"Output is: \"%@\"", ago);
2011-11-12 17:19:25.608 Proj[0:0] Output is: "41 years ago"
</pre>

## Future Directions

Would be nice to

1.  add customization options (e.g., should it report seconds or just "a minute ago") 
2.  add string customization
3.  add string localization
4.  add a separate method that understands "Last Friday", etc.
5.  other

## License

Released under ISC (similar to 2-clause BSD)

## Credits

Originally based on code Christopher Pickslay posted to Forrst. Used with permission.