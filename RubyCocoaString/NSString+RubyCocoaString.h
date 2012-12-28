//
//  NSString+RubyCocoaString.h
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RC_REGEX(regex) [NSRegularExpression regularExpressionWithPattern:(regex) \
							options:0 \
							error:nil]

@interface NSString (RubyCocoaString)

- (NSString *)camelize;
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
// True if it is literally the empty string (@"")
- (BOOL)isEmpty;
// True if it is just whitespace characters (@"  \t\n")
- (BOOL)isBlank;
// Opposite of isBlank
- (BOOL)isPresent;
- (NSString *)reverse;
- (NSArray *)split:(NSString *)splitString;
- (BOOL)startsWith:(NSString *)startString;
- (NSString *)strip;
- (NSString *)underscore;
- (NSString *)upcase;

// Unimplemented. Do not attempt to implement without first writing test cases!
// TODO: create a varg_list version
- (NSString *)delete:(NSString *)delString;

@end
