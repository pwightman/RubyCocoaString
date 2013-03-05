//
//  NSString+RubyCocoaString.h
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RC_REGEX(regex) [NSRegularExpression regularExpressionWithPattern:(regex) \
                                                                  options:0       \
                                                                    error:nil]

@interface NSString (RubyCocoaString)

- (NSString *)camelize;
- (NSString *)center:(NSInteger)width;
- (NSString *)center:(NSInteger)width padString:(NSString *)padString;
- (NSString *)capitalize;
- (NSString *)concat:(NSString *)aString;
- (NSString *)downcase;
- (void)eachChar:(void (^)(NSString *ch))block;
- (BOOL)endsWith:(NSString *)endString;
- (NSString *)gsub:(NSString *)regexStr withString:(NSString *)replacementString;
- (NSString *)gsubRegex:(NSRegularExpression *)regex withString:(NSString *)replacementString;
// NOTE: This does not currently meet all semantic use cases of the Ruby implementation.
- (NSString *)gsub:(NSString *)regexStr withBlock:(NSString *(^)(NSString *str, NSRange range))block;
- (NSString *)gsubRegex:(NSRegularExpression *)regex withBlock:(NSString *(^)(NSString *str, NSRange range))block;
- (BOOL)isEmpty; // True if it is literally the empty string (@"")
- (BOOL)isBlank; // True if it is just whitespace characters (@"  \t\n")
- (BOOL)isPresent; // Opposite of isBlank
- (NSString *)lowerCamelize;
- (NSString *)lstrip;
- (NSInteger) ord;
- (NSString *)prepend:(NSString *)aString;
- (NSString *)reverse;
- (NSString *)rstrip;
- (NSArray *)split:(NSString *)splitString;
- (BOOL)startsWith:(NSString *)startString;
- (NSString *)strip;
- (NSString *)underscore;
- (NSString *)upcase;

// Unimplemented Methods (Do not attempt to implement without first writing test cases!)

// TODO: create a varg_list version, perhaps?
// - (NSString *)delete:(NSString *)delString;

@end
