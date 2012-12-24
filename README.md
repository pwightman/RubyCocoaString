RubyCocoaString
===============

Ruby string manipulation methods for NSString, implemented as a category.

## Installation

1. [CocoaPods](http://cocoapods.org) by adding `pod 'RubyCocoaString'` to your `Podfile`.
2. Copy `NSString+RubyCocoaString.{h,m}` into your project.

## Discussion

`NSString` manipulation is very verbose and lacking in features when 
compared to modern scripting languages such as Ruby and Python. 
RubyCocoaString brings the [string manipulation methods from Ruby](http://www.ruby-doc.org/core-1.9.3/String.html) 
to NSString as a category. All semantics of the Ruby implementation of these methdods is preserved wherever possible, contributions and issues welcome when inconsistencies are found.

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

* [`capitalize`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-capitalize)
* [`concat`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-concat)
* [`downcase`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-downcase)
* [`end_with?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-end_with-3F)
* [`empty?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-empty-3F)
* [`blank?`](http://guides.rubyonrails.org/active_support_core_extensions.html#blank-and-present)
* [`present?`](http://guides.rubyonrails.org/active_support_core_extensions.html#blank-and-present)
* [`split`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-split)
* [`start_with?`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-start_with-3F)
* [`strip`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-strip)
* [`upcase`](http://www.ruby-doc.org/core-1.9.3/String.html#method-i-upcase)

## Contributing

**Always** write test cases before implementing methods. It's extremely easy, please ask if you've never written tests in Xcode before.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your tests, implement methods
4. Change README and other applicable documentation reflecting your changes.
5. Commit your changes (`git commit -am 'Added some feature'`)
7. Push to the branch (`git push origin my-new-feature`)
8. Create new Pull Request

## Contributors

[Parker Wightman](https://github.com/pwightman) ([@parkerwightman](http://twitter.com/parkerwightman))  
