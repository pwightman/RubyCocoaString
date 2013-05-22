RubyCocoaString
===============

Ruby string manipulation methods for NSString, implemented as a category.

## Installation

#### One of two options:

1. [CocoaPods](http://cocoapods.org) by adding `pod 'RubyCocoaString'` to your `Podfile`, run `pod install`, and import the headers with `#import <RubyCocoaString/NSString+RubyCocoaString.h>`.
2. Copy `NSString+RubyCocoaString.{h,m}` into your project, import it with `#import "NSString+RubyCocoaString.h"` as necessary.

## Discussion

`NSString` manipulation, while more fully-featured than you might imagine, is very verbose and burdensome when 
compared to modern scripting languages such as Ruby and Python. 
RubyCocoaString brings the [string manipulation methods from Ruby](http://www.ruby-doc.org/core-1.9.3/String.html) 
to NSString as a category. All semantics of the Ruby implementation of these methdods are preserved wherever possible, 
contributions and issues welcome when inconsistencies are found.

Small Cocoa-isms are applied as necessary, however. For example, the Ruby code:

```
"".empty?
"foo".end_with? "o"
```

would be written as the following in Objective-C:

```
[@"" isEmpty];
[@"foo" endsWith:@"o"];
```

A few methods are also borrowed from `ActiveSupport`, such as [`blank?` and `present?`](http://guides.rubyonrails.org/active_support_core_extensions.html#blank-and-present).

## Coverage

The following Ruby string methods are currently implemented:

#### String Methods
* [`capitalize`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-capitalize)
* [`center`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-center)
* [`concat`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-concat)
* [`downcase`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-downcase)
* [`end_with?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-end_with-3F)
* [`empty?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-empty-3F)
* [`gsub`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub)
* [`include?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-include-3F)
* [`lstrip`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-lstrip)
* [`ord`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-ord)
* [`prepend`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-prepend)
* [`reverse`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-reverse)
* [`rstrip`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-rstrip)
* [`split`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-split)
* [`start_with?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-start_with-3F)
* [`strip`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-strip)
* [`upcase`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-upcase)

#### ActiveSupport Methods
* [`blank?`](http://guides.rubyonrails.org/active_support_core_extensions.html#blank-and-present)
* [`camelize`](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-camelize)
* [`present?`](http://guides.rubyonrails.org/active_support_core_extensions.html#blank-and-present)
* [`underscore`](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-underscore)

#### Custom Methods
* `lowerCamelize` - Same as `camelize`, except first letter is lowercased. Helpful when, for example, an API returns `foo_bar` and you want to assign it to an Obj-C object's `fooBar` property.

(Tasteful variations on Ruby string methods, specifically helpful on iOS/Mac, are allowed as Custom Methods, but this is not meant to be a library with every possible string method under the sun. Pull requests welcome!)

## Examples

```
[@"   foo bar   " strip];
// => @"foo bar"

["foo_bar" camelize];
// => @"FooBar"

["foo_bar" lowerCamelize];
// => "fooBar"

[@"FooBar" underscore];
// => "foo_bar"

["  \t\n" isBlank];
// => YES

[@"foo bar" endsWith:@"bar"];
// => YES

[@"this is just madness" gsub:@"just" withString:@"pure"];
// => @"this is pure madness"

[@"this is JUST PLAIN madness" gsub:@"[A-Z]+" 
                          withBlock:^(NSString *str, NSRange range) {
    return ([str isEqualToString:@"JUST"] ? @"pure" : @"awesome");
}];
// => @"this is pure awesome madness"

[@"foo" eachChar:^(NSString *ch) {
    NSLog(@"%@", ch);
}];
// => f
// => o
// => o

[@"telescope" reverse];
// => @"epocselet"
```

## Caveats

#### Known implementation difficulties:

* `gsub` has some advanced semantic use cases which are difficult to satisfy, though most common use cases are semantically equivalent to its Ruby counterpart. It is used internally to implement many other RubyCocoaString methods. Part of the difficulty lies in semantic and syntactic differences in regular expressions between Ruby and Objective-C, and what is considered a 'match.'

## Contributing

**Always** write test cases before implementing methods. It's extremely easy, please ask if you've never written tests in Xcode before.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your tests, implement methods
4. Change README and other applicable documentation reflecting your changes
5. Commit your changes (`git commit -am 'Added some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Create new Pull Request

A few other notes:

* Please try to keep things alphabetized as best as possible, both file orderings of test cases within Xcode's file navigator, and methods within the header/implementation files of `NSString+RubyCocoaString.{h,m}`.
* This is an ideal library for coders new to the open source community to get involved, please do not hesitate to contribute or ask questions via issues, especially if you are new to testing in Xcode. I'm a nice guy :-)

## Contributors

[Parker Wightman](https://github.com/pwightman) ([@parkerwightman](http://twitter.com/parkerwightman))
