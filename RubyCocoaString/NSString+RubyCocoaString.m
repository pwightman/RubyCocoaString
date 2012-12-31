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

- (NSString *)center:(NSInteger)width {
	return [self center:width padString:@" "];
}

- (NSString *)center:(NSInteger)width padString:(NSString *)padString {
	if ([padString isEmpty]) return [self copy];
	if (width <= self.length) return [self copy];
	
	NSInteger leftWidth = (width - self.length) / 2;
	NSInteger rightWidth = leftWidth;
	
	// There's a potential off-by-one error for odd-width with even-length string.
	if (leftWidth + rightWidth + self.length < width) ++rightWidth;
	
	NSMutableString *str = [NSMutableString stringWithCapacity:width];
	
	for (NSInteger i = 0; i < leftWidth; i++) {
		[str appendString:[padString substringWithRange:NSMakeRange(i % padString.length, 1)]];
	}
	
	[str appendString:self];
	
	for (NSInteger i = 0; i < rightWidth; i++) {
		[str appendString:[padString substringWithRange:NSMakeRange(i % padString.length, 1)]];
	}
	
	return str;
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
	return [[self substringWithRange:NSMakeRange(self.length - endString.length,
												 endString.length)] isEqualToString:endString];
}

- (NSString *)gsub:(NSString *)regexStr withString:(NSString *)replacementString {
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
																		   options:0
																			 error:nil];
	return [self gsubRegex:regex withString:replacementString];
}

- (NSString *)gsubRegex:(NSRegularExpression *)regex withString:(NSString *)replacementString {
	return [regex stringByReplacingMatchesInString:self
										   options:0
											 range:NSMakeRange(0, self.length)
									  withTemplate:replacementString];
}

- (NSString *)gsub:(NSString *)regexStr withBlock:(NSString *(^)(NSString *, NSRange))block {
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr
																		   options:0
																			 error:nil];
	return [self gsubRegex:regex withBlock:block];
}

- (NSString *)gsubRegex:(NSRegularExpression *)regex withBlock:(NSString *(^)(NSString *, NSRange))block {
	NSArray *matches = [regex matchesInString:self
									  options:0
										range:NSMakeRange(0, self.length)];
	
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
	return [self strip].length == 0;
}

- (BOOL)isPresent {
	return ![self isBlank];
}

- (NSString *)lowerCamelize {
	NSString *camelized = [self camelize];
	if (camelized.length == 0) return @"";
	
	return [camelized stringByReplacingCharactersInRange:NSMakeRange(0, 1)
											  withString:[[camelized substringToIndex:1] downcase]];
}

- (NSString *)lstrip {
	return [self gsub:@"^\\s*" withString:@""];
}

- (NSInteger) ord {
	return (NSInteger)[self characterAtIndex:0];
}

- (NSString *)prepend:(NSString *)aString {
	return [aString stringByAppendingString:self];
}

- (NSString *)reverse {
	NSMutableString *newString = [NSMutableString string];
	
	for (NSInteger i = self.length; i > 0; i--) {
		[newString appendString:[self substringWithRange:NSMakeRange(i - 1, 1)]];
	}
	
	return newString;
}

- (NSString *)rstrip {
	return [self gsub:@"\\s*$" withString:@""];
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
