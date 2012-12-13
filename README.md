## Description

This is an iOS, Objective-C, Cocoa Touch, iPhone, iPad category for NSDate. It gives NSDate the ability to report times like "A moment ago", "30 seconds ago", "5 minutes ago", "Yesterday", "Last Month", "2 Years Ago", and so on.

This functionality has variously been referred to as a "time ago", "time since", "relative date", or "fuzzy date" feature.

NSDate+TimeAgo currently supports the following languages: en (English), es (Spanish), zh_Hans (Chinese Simplified), pt_BR (Brazilian Portuguese), fr (French), it (Italian), ru (Russian), de (German)

If you know a language not listed here, please consider submitting a translation.

## Use

1.  Add the files to your project (including the localization files)
2.  Import the header using  `#import "NSDate+TimeAgo.h"`
3.  Call the `timeAgo` method in the following way:

<pre>
NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:0]
NSString *ago = [date timeAgo];
NSLog(@"Output is: \"%@\"", ago);
2011-11-12 17:19:25.608 Proj[0:0] Output is: "41 years ago"
</pre>

<pre>
NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:0]
NSString *ago = [date timeAgoWithLimit:(10*24*3600)];
NSLog(@"Output is: \"%@\"", ago);
2011-11-12 17:19:25.608 Proj[0:0] Output is a date with time and FullStyle
</pre>

<pre>
NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:0]
NSString *ago = [date timeAgoWithLimit:(10*24*3600) dateFormat:NSDateFormatterFullStyle andTimeFormat:NSDateFormatterNoStyle];
NSLog(@"Output is: \"%@\"", ago);
2011-11-12 17:19:25.608 Proj[0:0] Output is a date with time and styles you specify
</pre>

## Future Directions

Would be nice to

1.  add customization options (e.g., should it report seconds or just "a minute ago") 
2.  add string customization
3.  have more localizations
4.  add a separate method that understands "Last Friday", etc.
5.  other

## License

Released under ISC (similar to 2-clause BSD)

http://wikipedia.org/wiki/ISC_license

## Credits

Originally based on code Christopher Pickslay posted to Forrst. Used with permission. http://twitter.com/cpickslay 

Ramon Torres began support for internationalization/localization. Added `es` strings. http://rtorres.me/

Dennis Zhuang added `zh_Hans` Chinese Simplified strings. http://fnil.net/

Mozart Petter added `pt_BR` Brazilian Portuguese strings. http://www.mozartpetter.com/

Stéphane Gerardot added `fr` French strings.

Marco Sanson added `it` Italian strings. http://marcosanson.tumblr.com/

Almas Adilbek added `ru` Russian strings. Extended logic to support Russian idioms. http://mixdesign.kz/

Mallox51 added `de` German strings. https://github.com/Mallox51
