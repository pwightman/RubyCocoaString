//
//  NSString+RubyCocoaString.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/23/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "NSString+RubyCocoaString.h"

@implementation NSString (RubyCocoaString)

- (NSString *)camelize {
	// Remove leading and trailing underscores
	NSString *str = [self gsub:@"^_*" withString:@""];
	str = [str gsub:@"_*$" withString:@""];
	
	// Capitalize will also capitalize all letters following underscores. Nice.
	str = [str capitalize];
	return [str gsub:@"_" withString:@""];
}

- (NSString *)capitalize {
	return [self capitalizedString];
}

- (NSString *)concat:(NSString *)aString {
	return [self stringByAppendingString:aString];
}

- (NSString *)downcase {
	return [self lowercaseString];
}

- (void) eachChar:(void (^)(NSString *))block {
	for (NSInteger i = 0; i < self.length; i++) {
		block([self substringWithRange:NSMakeRange(i, 1)]);
	}
}

- (BOOL) endsWith:(NSString *)endString {
	if (self.length < endString.length) return NO;
	return [[self substringWithRange:NSMakeRange(self.length - endString.length, endString.length)] isEqualToString:endString];
}

- (NSString *)gsub:(NSString *)regexStr withString:(NSString *)replacementString {
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:nil];
	return [self gsubRegex:regex withString:replacementString];
}

- (NSString *)gsubRegex:(NSRegularExpression *)regex withString:(NSString *)replacementString {
	return [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:replacementString];
}

- (NSString *)gsub:(NSString *)regexStr withBlock:(NSString *(^)(NSString *, NSRange))block {
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:nil];
	return [self gsubRegex:regex withBlock:block];
}

- (NSString *)gsubRegex:(NSRegularExpression *)regex withBlock:(NSString *(^)(NSString *, NSRange))block {
	NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
	
	NSString *result = [self copy];
	
	/*
	 The string that will be inserted may be of a different length than the string it will
	 replace, so we need to keep track of the differences in length in the new strings and
	 the original string inside of dx.
	*/
	NSInteger dx = 0;
	
	for (NSTextCheckingResult *match in matches) {
		NSString *originalStr = [self substringWithRange:[match range]];
		NSString *replaceStr = block(originalStr, [match range]);
		NSRange newRange = [match range];
		newRange.location += dx;
		result = [result stringByReplacingCharactersInRange:newRange withString:replaceStr];
		dx += replaceStr.length - originalStr.length;
	}
	
	return result;
}

- (BOOL)isEmpty {
	return self.length == 0;
}

- (BOOL)isBlank {
	return [[[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""] isEmpty];
}

- (BOOL)isPresent {
	return ![self isBlank];
}

- (NSString *) reverse {
	NSString *newString = @"";
	
	for (NSInteger i = 0; i < self.length; i++) {
		newString = [newString stringByAppendingString:[self substringWithRange:NSMakeRange(self.length - i - 1, 1)]];
	}
	
	return newString;
}

- (NSArray *)split:(NSString *)splitString {
	// The empty string should return an array of each character
	if ([splitString isEmpty]) {
		NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.length];
		
		for (NSInteger i = 0; i < self.length; i++) {
			[array addObject:[self substringWithRange:NSMakeRange(i, 1)]];
		}
		
		return array;
	} else {
		return [self componentsSeparatedByString:splitString];
	}
}

- (BOOL) startsWith:(NSString *)startString {
	if (self.length < startString.length) return NO;
	return [[self substringWithRange:NSMakeRange(0, startString.length)] isEqualToString:startString];
}


- (NSString *)strip {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)underscore {
	NSString *str = [self gsub:@"-" withString:@"_"];
	
	str = [str gsub:@"[A-Z]+" withBlock:^NSString *(NSString *str, NSRange range) {
		// We want this to apply to everything except if the capital letter is the first
		// letter in the string.
		if (range.location == 0) return str;
		return [NSString stringWithFormat:@"_%@", [str downcase]];
	}];
	
	return [str downcase];
}

- (NSString *)upcase {
	return [self uppercaseString];
}

@end
