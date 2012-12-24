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
- (NSArray *) split:(NSString *)splitString;
// If it is literally the empty string (@"")
- (BOOL) isEmpty;
// If it is just whitespace characters (@"  \t\n")
- (BOOL) isBlank;
// Opposite of isBlank
- (BOOL) isPresent;

// Unimplemented. Do not attempt to implement without first writing test cases!
- (NSString *)upcase;
- (NSString *)downcase;
- (NSString *)capitalize;
- (NSString *)concat;
- (BOOL)endsWith:(NSString *)endString;
- (BOOL)beginsWith:(NSString *)beginString;
// TODO: create a varg_list version
- (NSString *)delete:(NSString *)delString;
- (void)eachChar:(void (^)(NSString *ch))block;
- (NSString *)gsub:(NSRegularExpression *)regex withString:(NSString *)replacementString;
- (NSString *)gsub:(NSRegularExpression *)regex withBlock:(NSString *(^)(NSString *str))block;

@end
